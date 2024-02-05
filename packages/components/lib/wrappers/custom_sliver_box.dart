import 'package:flutter/material.dart';

/// Custom Widget for make a `Container` with `Padding` inside a `Sliver Widget`
class CustomSliverBox extends StatelessWidget {
  const CustomSliverBox({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.background,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: padding,
        margin: margin,
        color: background,
        child: child,
      ),
    );
  }
}
