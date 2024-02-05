/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add.svg
  SvgGenImage get add => const SvgGenImage('assets/icons/add.svg');

  /// File path: assets/icons/calendar_add_bold_duotone.svg
  SvgGenImage get calendarAddBoldDuotone =>
      const SvgGenImage('assets/icons/calendar_add_bold_duotone.svg');

  /// File path: assets/icons/calendar_month.svg
  SvgGenImage get calendarMonth =>
      const SvgGenImage('assets/icons/calendar_month.svg');

  /// File path: assets/icons/check_circle.svg
  SvgGenImage get checkCircle =>
      const SvgGenImage('assets/icons/check_circle.svg');

  /// File path: assets/icons/document.svg
  SvgGenImage get document => const SvgGenImage('assets/icons/document.svg');

  /// File path: assets/icons/error_outline.svg
  SvgGenImage get errorOutline =>
      const SvgGenImage('assets/icons/error_outline.svg');

  /// File path: assets/icons/event_repeat.svg
  SvgGenImage get eventRepeat =>
      const SvgGenImage('assets/icons/event_repeat.svg');

  /// File path: assets/icons/form.svg
  SvgGenImage get form => const SvgGenImage('assets/icons/form.svg');

  /// File path: assets/icons/info.svg
  SvgGenImage get info => const SvgGenImage('assets/icons/info.svg');

  /// File path: assets/icons/keyboard_arrow_down.svg
  SvgGenImage get keyboardArrowDown =>
      const SvgGenImage('assets/icons/keyboard_arrow_down.svg');

  /// File path: assets/icons/keyboard_arrow_up.svg
  SvgGenImage get keyboardArrowUp =>
      const SvgGenImage('assets/icons/keyboard_arrow_up.svg');

  /// File path: assets/icons/leave.svg
  SvgGenImage get leave => const SvgGenImage('assets/icons/leave.svg');

  /// File path: assets/icons/observation.svg
  SvgGenImage get observation =>
      const SvgGenImage('assets/icons/observation.svg');

  /// File path: assets/icons/question.svg
  SvgGenImage get question => const SvgGenImage('assets/icons/question.svg');

  /// File path: assets/icons/suitcase_tag_bold_duotone.svg
  SvgGenImage get suitcaseTagBoldDuotone =>
      const SvgGenImage('assets/icons/suitcase_tag_bold_duotone.svg');

  /// File path: assets/icons/travel.svg
  SvgGenImage get travel => const SvgGenImage('assets/icons/travel.svg');

  /// File path: assets/icons/warning.svg
  SvgGenImage get warning => const SvgGenImage('assets/icons/warning.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        add,
        calendarAddBoldDuotone,
        calendarMonth,
        checkCircle,
        document,
        errorOutline,
        eventRepeat,
        form,
        info,
        keyboardArrowDown,
        keyboardArrowUp,
        leave,
        observation,
        question,
        suitcaseTagBoldDuotone,
        travel,
        warning
      ];
}

class $AssetsIllustrationsGen {
  const $AssetsIllustrationsGen();

  /// File path: assets/illustrations/dialog_confirmation.svg
  SvgGenImage get dialogConfirmation =>
      const SvgGenImage('assets/illustrations/dialog_confirmation.svg');

  /// File path: assets/illustrations/dialog_error.svg
  SvgGenImage get dialogError =>
      const SvgGenImage('assets/illustrations/dialog_error.svg');

  /// File path: assets/illustrations/dialog_information.svg
  SvgGenImage get dialogInformation =>
      const SvgGenImage('assets/illustrations/dialog_information.svg');

  /// File path: assets/illustrations/dialog_success.svg
  SvgGenImage get dialogSuccess =>
      const SvgGenImage('assets/illustrations/dialog_success.svg');

  /// File path: assets/illustrations/wave_leave.svg
  SvgGenImage get waveLeave =>
      const SvgGenImage('assets/illustrations/wave_leave.svg');

  /// File path: assets/illustrations/wave_leave_free.svg
  SvgGenImage get waveLeaveFree =>
      const SvgGenImage('assets/illustrations/wave_leave_free.svg');

  /// File path: assets/illustrations/wave_leave_other.svg
  SvgGenImage get waveLeaveOther =>
      const SvgGenImage('assets/illustrations/wave_leave_other.svg');

  /// File path: assets/illustrations/wave_leave_yearly.svg
  SvgGenImage get waveLeaveYearly =>
      const SvgGenImage('assets/illustrations/wave_leave_yearly.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        dialogConfirmation,
        dialogError,
        dialogInformation,
        dialogSuccess,
        waveLeave,
        waveLeaveFree,
        waveLeaveOther,
        waveLeaveYearly
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/emp_srv_background.svg
  SvgGenImage get empSrvBackground =>
      const SvgGenImage('assets/images/emp_srv_background.svg');

  /// List of all assets
  List<SvgGenImage> get values => [empSrvBackground];
}

class Assets {
  Assets._();

  static const String package = 'resources';

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsIllustrationsGen illustrations =
      $AssetsIllustrationsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  static const String package = 'resources';

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/resources/$_assetName';
}
