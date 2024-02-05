import 'package:flutter/material.dart';

/// The `CustomSliverBox` widget is designed for creating a sliver-based container with padding.
/// It wraps a child widget and allows you to specify additional parameters such as `padding`,
/// `margin`, and `background` color within a `Sliver` context.
///
/// ## Usage
/// To use `CustomSliverBox`, create an instance of the widget by providing the desired `child`.
/// You can customize its appearance using optional parameters like `padding`, `margin`, and `background`.
///
/// Example:
/// ```dart
/// // Create a sliver box with a text widget as a child and a specified background color
/// CustomSliverBox(
///   child: Text('Sliver Box Content'),
///   padding: EdgeInsets.all(16),
///   margin: EdgeInsets.symmetric(vertical: 8),
///   background: Colors.blue,
/// );
/// ```
///
/// ## Parameters
/// - `child`: The widget to be contained within the sliver box.
/// - `padding`: The padding around the content inside the sliver box.
/// - `margin`: The margin around the entire sliver box.
/// - `background`: The background color of the sliver box.
///
/// Example:
/// ```dart
/// // Create a sliver box with a blue background and specified padding
/// CustomSliverBox(
///   child: SomeWidget(),
///   padding: EdgeInsets.all(12),
///   background: Colors.blue,
/// );
/// ```
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
