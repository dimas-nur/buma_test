import 'package:components/gaps/gap.dart';
import 'package:core/extensions/extensions.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../labels/label_field.dart';

/// The `DateInput` widget provides a customizable date input field with support for labels,
/// hints, error messages, and additional information. Users can select a date from a date picker
/// that pops up when the text field is tapped. The selected date is displayed in the input field.
///
/// ## Usage
/// To use `DateInput`, create an instance of the widget by providing the necessary parameters,
/// such as `label`, `hint`, and `onChanged`. Customize its appearance and behavior using optional
/// parameters like `isRequired`, `isEnabled`, and `validator`. The `onChanged` callback is triggered
/// when the user selects a date.
///
/// Example:
/// ```dart
/// // Create a date input with a label and hint
/// DateInput(
///   label: 'Birthdate',
///   hint: 'DD MMM YYYY',
///   initialDate: DateTime.now(),
///   firstDate: DateTime(1900),
///   lastDate: DateTime.now(),
///   onChanged: (selectedDate) {
///     print('Selected Date: $selectedDate');
///   },
/// );
/// ```
///
/// ## Parameters
/// - `controller`: The `TextEditingController` to control the text input field.
/// - `hint`: The hint text to display when the input field is empty.
/// - `label`: The label text for the input field.
/// - `information`: Additional information or error message to display below the input field.
/// - `initialDate`: The initial selected date when the date picker opens.
/// - `firstDate`: The earliest allowable date in the date picker.
/// - `lastDate`: The latest allowable date in the date picker.
/// - `isRequired`: Indicates whether the input is required, displaying a '*' next to the label.
/// - `isEnabled`: Enables or disables the text input field.
/// - `onChanged`: A callback function triggered when the user selects a date.
/// - `validator`: A function that performs input validation and returns an error message if needed.
///
/// Example:
/// ```dart
/// // Create a date input with a custom validator
/// DateInput(
///   label: 'Appointment Date',
///   hint: 'DD MMM YYYY',
///   initialDate: DateTime.now(),
///   firstDate: DateTime.now(),
///   lastDate: DateTime.now().add(Duration(days: 365)),
///   onChanged: (selectedDate) {
///     print('Selected Date: $selectedDate');
///   },
///   validator: (value) {
///     if (value == null) {
///       return 'Please select a date';
///     }
///     return null;
///   },
/// );
/// ```
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
