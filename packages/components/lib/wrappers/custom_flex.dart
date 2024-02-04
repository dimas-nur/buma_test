import 'package:flutter/material.dart';

/// Custom Widget for make a `Column` with `Padding` inside a `non-Sliver widget`
class CustomColumn extends StatelessWidget {
  const CustomColumn({
    super.key,
    required this.children,
    this.padding,
    this.mainAxisSize = MainAxisSize.max,
    this.background,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final Color? background;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: background,
      child: Column(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}

/// Custom Widget for make a `Row` with `Padding` inside a `non-Sliver Widget`
class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.children,
    this.padding,
    this.background,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final Color? background;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: background,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}
