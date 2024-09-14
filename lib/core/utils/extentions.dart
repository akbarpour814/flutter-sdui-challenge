import 'package:flutter/material.dart';

extension NumberParsing on num {
  /// device width * x / 100
  double w(BuildContext context) =>
      this * MediaQueryData.fromView(View.of(context)).size.width / 100;

  /// device height * x / 100
  double h(BuildContext context) =>
      this * MediaQueryData.fromView(View.of(context)).size.height / 100;

  /// returned SizedBox with width = x
  Widget wsb({Widget? child}) => SizedBox(
        width: toDouble(),
        child: child,
      );

  /// returned SizedBox with height = x
  Widget hsb({Widget? child}) => SizedBox(
        height: toDouble(),
        child: child,
      );

  /// returned SizedBox with height = x, width = x
  Widget whsb({Widget? child}) => SizedBox(
        width: toDouble(),
        height: toDouble(),
        child: child,
      );
}

extension StringUtil on String? {
  /// check if string is not empty or null
  bool get isNotNullOrEmpty =>
      this != null && this != 'Null' && this != 'null' && this!.isNotEmpty;
}
