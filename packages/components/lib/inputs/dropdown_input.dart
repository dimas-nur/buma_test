// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:components/gaps/gap.dart';
import 'package:core/extensions/text_style.extension.dart';
import 'package:core/resources/resources.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../labels/label_field.dart';

class DropdownInput extends StatefulWidget {
  const DropdownInput({
    super.key,
    this.hint,
    required this.label,
    this.iconPath,
    this.information,
    this.selectedValue,
    this.item,
    this.isRequired = false,
    this.isEnabled = true,
    required this.onChanged,
    this.validator,
  });

  final String? hint;
  final String? label;
  final String? iconPath;
  final String? information;
  final int? selectedValue;
  final Map<int, String>? item;
  final bool isRequired;
  final bool isEnabled;
  final void Function(int?)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<DropdownInput> createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  bool _isOpened = false;

  String? _error;
  bool get _hasError => _error != null;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.isEnabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) ..._label,
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField2<int>(
              items: widget.item?.entries
                  .map((item) => DropdownMenuItem<int>(
                        value: item.key,
                        child: Text(
                          item.value,
                          style: AppTypography.body.colorDark,
                        ),
                      ))
                  .toList(),
              value: widget.selectedValue,
              customButton: _customButton,
              isExpanded: true,
              isDense: true,
              decoration: const InputDecoration(
                isDense: true,
                isCollapsed: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                errorStyle: TextStyle(
                  inherit: false,
                  height: 1,
                  fontSize: 0,
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                useSafeArea: false,
                offset: Offset(0, -4.h),
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.strokeTertiary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      spreadRadius: -2,
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 24.h,
                selectedMenuItemBuilder: (_, child) => Container(
                  color: AppColors.info100,
                  child: child,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                ),
              ),
              validator: (value) {
                _error = widget.validator?.call(widget.item?[value]);

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {});
                });

                return _error;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onMenuStateChange: (isOpened) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => setState(() => _isOpened = isOpened),
                );
              },
              onChanged: widget.onChanged,
            ),
          ),
          if (_hasError || widget.information != null) ..._information,
        ],
      ),
    );
  }

  List<Widget> get _label => [
        LabelField(
          label: widget.label!,
          required: widget.isRequired,
          iconPath: widget.iconPath,
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

  Widget get _customButton {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: 40.h,
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
          if (widget.hint != null || widget.selectedValue != null)
            Expanded(
              child: Text(
                widget.item?.entries
                        .firstWhereOrNull((e) => e.key == widget.selectedValue)
                        ?.value ??
                    widget.hint!,
                style: AppTypography.body.toColor(
                  (_hasError && !_isOpened)
                      ? AppColors.danger500
                      : !widget.isEnabled || widget.selectedValue == null
                          ? AppColors.textLightDark
                          : AppColors.textDark,
                ),
              ),
            )
          else
            const Spacer(),
          Gap.w12,
          if (_hasError && !_isOpened) ...[
            Gap.w8,
            Assets.icons.errorOutline.svg(
              width: 20.r,
              height: 20.r,
              // ignore: deprecated_member_use
              color: AppColors.danger500,
            ),
            Gap.w12,
          ],
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
            child: (_isOpened
                    ? Assets.icons.keyboardArrowUp
                    : Assets.icons.keyboardArrowDown)
                .svg(
              width: 24.r,
              height: 24.r,
              // ignore: deprecated_member_use
              color: (_hasError && !_isOpened)
                  ? AppColors.danger500
                  : !widget.isEnabled
                      ? AppColors.iconLightDark
                      : AppColors.iconDark,
            ),
          ),
        ],
      ),
    );
  }
}
