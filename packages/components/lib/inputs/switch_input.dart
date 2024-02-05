import 'package:components/gaps/gap.dart';
import 'package:core/extensions/extensions.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../labels/label_field.dart';

class SwitchInput extends StatelessWidget {
  const SwitchInput({
    super.key,
    this.hint,
    this.label,
    this.information,
    required this.value,
    this.isRequired = false,
    this.isEnabled = true,
    required this.onChanged,
  });

  final String? hint;
  final String? label;
  final String? information;
  final bool value;
  final bool isRequired;
  final bool isEnabled;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ..._label,
        _switch,
        if (information != null) ..._information,
      ],
    );
  }

  List<Widget> get _label => [
        LabelField(
          label: label!,
          required: isRequired,
        ),
        Gap.h4,
      ];

  List<Widget> get _information => [
        Gap.h4,
        Text(
          information ?? '',
          style: AppTypography.bodySmall.colorLightDark,
        ),
      ];

  Widget get _switch {
    return IgnorePointer(
      ignoring: !isEnabled,
      child: SizedBox(
        height: 40.h,
        child: Transform.scale(
          scale: .8,
          alignment: Alignment.centerLeft,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: isEnabled
                ? AppColors.primary500
                : AppColors.primary500.withOpacity(.5),
            inactiveTrackColor: isEnabled
                ? AppColors.neutral500
                : AppColors.neutral400.withOpacity(.5),
            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
            thumbColor: MaterialStateProperty.all(AppColors.iconWhite),
          ),
        ),
      ),
    );
  }
}
