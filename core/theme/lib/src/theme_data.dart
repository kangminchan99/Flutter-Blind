import 'package:flutter/widgets.dart';

abstract class ICoreThemeData {
  final ICoreTextTheme textTheme;
  final ICoreColorScheme colorScheme;

  const ICoreThemeData({required this.textTheme, required this.colorScheme});
}

abstract class ICoreTextTheme {
  const ICoreTextTheme();
}

abstract class ICoreColorScheme {
  final Brightness brightness;

  const ICoreColorScheme({required this.brightness});
}
