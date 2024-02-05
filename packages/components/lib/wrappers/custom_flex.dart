import 'package:flutter/material.dart';

/// The `CustomColumn` widget is a customizable container for creating a vertical layout using a `Column`.
/// It allows you to define padding, margin, background color, and other layout-related parameters.
///
/// ## Usage
/// To use `CustomColumn`, create an instance of the widget by specifying the `children` parameter
/// (a list of widgets to be placed vertically), and customize its appearance using optional parameters
/// such as `padding`, `margin`, `background`, `mainAxisSize`, `mainAxisAlignment`, and `crossAxisAlignment`.
///
/// Example:
/// ```dart
/// // Create a custom column with specified children and padding
/// CustomColumn(
///   children: [
///     Text('Item 1'),
///     Text('Item 2'),
///   ],
///   padding: EdgeInsets.all(16),
/// );
/// ```
///
/// ## Parameters
/// - `children`: A list of widgets to be placed vertically in the column.
/// - `padding`: Padding around the column.
/// - `margin`: Margin around the column.
/// - `background`: Background color of the column.
/// - `mainAxisSize`: The size of the column in the main axis.
/// - `mainAxisAlignment`: The alignment of children along the main axis.
/// - `crossAxisAlignment`: The alignment of children along the cross axis.
///
/// Example:
/// ```dart
/// // Create a custom column with a specified background color and main axis alignment
/// CustomColumn(
///   children: [
///     Text('Item 1'),
///     Text('Item 2'),
///   ],
///   background: Colors.grey,
///   mainAxisAlignment: MainAxisAlignment.center,
/// );
/// ```
class CustomColumn extends StatelessWidget {
  const CustomColumn({
    super.key,
    required this.children,
    this.padding,
    this.margin,
    this.mainAxisSize = MainAxisSize.max,
    this.background,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final Color? background;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
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

/// The `CustomRow` widget is a customizable container for creating a horizontal layout using a `Row`.
/// It allows you to define padding, margin, background color, and other layout-related parameters.
///
/// ## Usage
/// To use `CustomRow`, create an instance of the widget by specifying the `children` parameter
/// (a list of widgets to be placed horizontally), and customize its appearance using optional parameters
/// such as `padding`, `margin`, `background`, `mainAxisAlignment`, and `crossAxisAlignment`.
///
/// Example:
/// ```dart
/// // Create a custom row with specified children and padding
/// CustomRow(
///   children: [
///     Text('Item 1'),
///     Text('Item 2'),
///   ],
///   padding: EdgeInsets.all(16),
/// );
/// ```
///
/// ## Parameters
/// - `children`: A list of widgets to be placed horizontally in the row.
/// - `padding`: Padding around the row.
/// - `margin`: Margin around the row.
/// - `background`: Background color of the row.
/// - `mainAxisAlignment`: The alignment of children along the main axis.
/// - `crossAxisAlignment`: The alignment of children along the cross axis.
///
/// Example:
/// ```dart
/// // Create a custom row with a specified background color and main axis alignment
/// CustomRow(
///   children: [
///     Text('Item 1'),
///     Text('Item 2'),
///   ],
///   background: Colors.grey,
///   mainAxisAlignment: MainAxisAlignment.center,
/// );
/// ```
class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.children,
    this.padding,
    this.margin,
    this.background,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? background;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      color: background,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}
