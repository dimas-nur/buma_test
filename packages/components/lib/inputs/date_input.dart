import 'package:components/gaps/gap.dart';
import 'package:core/extensions/extensions.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../labels/label_field.dart';

class DateInput extends StatefulWidget {
  const DateInput({
    super.key,
    this.hint = 'DD MMM YYYY',
    required this.label,
    this.controller,
    this.information,
    this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.isRequired = false,
    this.isEnabled = true,
    required this.onChanged,
    this.validator,
  });

  final String? hint;
  final String? label;
  final String? information;
  final TextEditingController? controller;
  final DateTime? initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final bool isRequired;
  final bool isEnabled;
  final void Function(DateTime?)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController();

  bool _isOpened = false;

  String? _error;
  bool get _hasError => _error != null;

  Future<void> _showDatePicker() async {
    final maxInitialDate =
        (widget.initialDate ?? DateTime.now()).isBefore(widget.firstDate)
            ? widget.firstDate
            : (widget.initialDate ?? DateTime.now());

    final date = await showDatePicker(
      context: context,
      initialDate: maxInitialDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );

    if (date != null) {
      widget.onChanged?.call(date);
      _controller.text = date.dateTextFormat(isCompactMonth: true);
    }

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() => _isOpened = false),
    );
  }

  void _setIsOpened(bool isOpened) {
    if (isOpened != _isOpened) {
      if (isOpened) _showDatePicker();

      WidgetsBinding.instance.addPostFrameCallback(
        (_) => setState(
          () => _isOpened = isOpened,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ..._label,
        _dateInputCard,
        if (_hasError || widget.information != null) ..._information,
      ],
    );
  }

  List<Widget> get _label => [
        LabelField(
          label: widget.label!,
          required: widget.isRequired,
        ),
        Gap.h4,
      ];

  List<Widget> get _information => [
        Gap.h4,
        Text(
          _error ?? widget.information ?? '',
          style: AppTypography.bodySmall.toColor(
            _hasError && !_isOpened
                ? AppColors.danger500
                : AppColors.textLightDark,
          ),
        ),
      ];

  Widget get _dateInputCard {
    return GestureDetector(
      onTap: widget.isEnabled ? () => _setIsOpened(true) : null,
      child: AnimatedContainer(
        height: 40.h,
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: _isOpened
                ? AppColors.primary500
                : _hasError
                    ? AppColors.danger500
                    : AppColors.strokeTertiary,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          color: widget.isEnabled
              ? AppColors.backgroundWhite
              : AppColors.backgroundLight,
        ),
        child: Row(
          children: [
            Gap.w8,
            Expanded(
              child: TextFormField(
                style: AppTypography.body.copyWith(
                  inherit: true,
                  color: widget.isEnabled
                      ? AppColors.textDark
                      : AppColors.textLightDark,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  hintText: widget.hint,
                  hintStyle: AppTypography.body.colorLight,
                  border: InputBorder.none,
                  errorStyle: const TextStyle(
                    inherit: false,
                    height: 1,
                    fontSize: 0,
                  ),
                ),
                readOnly: true,
                enabled: widget.isEnabled,
                controller: _controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  _error = widget.validator?.call(value);

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {});
                  });

                  return _error;
                },
                onTap: () => _setIsOpened(true),
                onTapOutside: (_) => _setIsOpened(false),
              ),
            ),
            Gap.w12,
            AnimatedContainer(
              height: 40.h,
              width: 40.h,
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  color: _isOpened
                      ? AppColors.primary500
                      : _hasError
                          ? AppColors.danger500
                          : AppColors.strokeTertiary,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              alignment: Alignment.center,
              child: Assets.icons.calendarMonth.svg(
                width: 16.r,
                height: 16.r,
                // ignore: deprecated_member_use
                color: widget.isEnabled
                    ? AppColors.iconDark
                    : AppColors.iconLightDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
