import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:tool_blind_theme/src/theme_data.dart';

class BlindTheme extends ICoreTheme {
  const BlindTheme({
    super.key,
    required super.child,
    required BlindThemeData themeData,
  }) : super(themeData: themeData);

  static BlindThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlindTheme>()!.themeData
        as BlindThemeData;
  }
}
