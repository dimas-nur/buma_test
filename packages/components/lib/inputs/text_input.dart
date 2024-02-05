import 'package:components/gaps/gap.dart';
import 'package:core/extensions/extensions.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../labels/label_field.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    this.hint,
    this.controller,
    required this.label,
    this.information,
    this.isRequired = false,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
  });

  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final String? information;
  final bool isRequired;
  final bool isEnabled;
  final bool isReadOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController();

  String? _error;
  bool get _hasError => _error != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ..._label,
        _inputCard,
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
            _hasError ? AppColors.danger500 : AppColors.textLightDark,
          ),
        ),
      ];

  Widget get _inputCard {
    return SizedBox(
      height: 40.h,
      child: TextFormField(
        style: AppTypography.body.copyWith(
          inherit: true,
          color:
              widget.isEnabled ? AppColors.textDark : AppColors.textLightDark,
        ),
        decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(
            maxHeight: 16.r,
            maxWidth: 32.r,
          ),
          suffixIcon: _hasError
              ? Padding(
                  padding: EdgeInsets.only(
                    left: 8.w,
                    right: 8.w,
                  ),
                  child: Assets.icons.errorOutline.svg(
                    width: 16.r,
                    height: 16.r,
                    // ignore: deprecated_member_use
                    color: AppColors.danger500,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
          hintText: widget.hint,
          hintStyle: AppTypography.body.colorLight,
          fillColor: widget.isEnabled
              ? AppColors.backgroundWhite
              : AppColors.backgroundLight,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(
              color: AppColors.strokeTertiary,
              width: 1.w,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(
              color: AppColors.strokeTertiary,
              width: 1.w,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(
              color: AppColors.primary500,
              width: 1.w,
              style: BorderStyle.solid,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(
              color: AppColors.danger500,
              width: 1.w,
              style: BorderStyle.solid,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(
              color: AppColors.danger500,
              width: 1.w,
              style: BorderStyle.solid,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(
              color: AppColors.strokeTertiary,
              width: 1.w,
              style: BorderStyle.solid,
            ),
          ),
          errorStyle: const TextStyle(
            inherit: false,
            height: 1,
            fontSize: 0,
          ),
        ),
        readOnly: widget.isReadOnly,
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
      ),
    );
  }
}
