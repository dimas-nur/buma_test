import 'package:components/gaps/gap.dart';
import 'package:core/extensions/extensions.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../labels/label_field.dart';

/// The `SwitchInput` widget provides a customizable switch input field with support for labels,
/// hints, and additional information. Users can toggle the switch to change its state.
///
/// ## Usage
/// To use `SwitchInput`, create an instance of the widget by providing the necessary parameters,
/// such as `label`, `hint`, and `onChanged`. Customize its appearance and behavior using optional
/// parameters like `isRequired`, `isEnabled`, and `information`. The `onChanged` callback is triggered
/// when the user toggles the switch.
///
/// Example:
/// ```dart
/// // Create a switch input with a label and onChanged callback
/// SwitchInput(
///   label: 'Enable Notifications',
///   hint: 'Turn on to receive notifications',
///   value: isNotificationsEnabled,
///   onChanged: (isEnabled) {
///     print('Notifications Enabled: $isEnabled');
///     // Update the state or perform actions based on the switch state
///   },
/// );
/// ```
///
/// ## Parameters
/// - `hint`: The hint text to display next to the switch.
/// - `label`: The label text for the switch.
/// - `information`: Additional information to display below the switch.
/// - `value`: The current state of the switch (true for ON, false for OFF).
/// - `isRequired`: Indicates whether the switch is required, displaying a '*' next to the label.
/// - `isEnabled`: Enables or disables the switch input field.
/// - `onChanged`: A callback function triggered when the user toggles the switch.
///
/// Example:
/// ```dart
/// // Create a switch input with additional information
/// SwitchInput(
///   label: 'Dark Mode',
///   hint: 'Toggle to enable dark mode',
///   value: isDarkModeEnabled,
///   onChanged: (isEnabled) {
///     print('Dark Mode Enabled: $isEnabled');
///     // Update the state or perform actions based on the switch state
///   },
///   information: 'Enable dark mode for a better viewing experience.',
/// );
/// ```
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
