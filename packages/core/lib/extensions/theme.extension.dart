import 'package:flutter/material.dart';

/// [Info]
///
/// Extension for get Theme from BuildContext
extension XTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
}
