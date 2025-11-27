import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tool_blind_theme/gen/colors.gen.dart';
import 'package:tool_blind_theme/gen/fonts.gen.dart';
import 'package:tool_blind_theme/theme.dart';

class BlindThemeData extends ICoreThemeData {
  const BlindThemeData({
    required super.appBarTheme,
    required super.textTheme,
    required super.colorScheme,
    required super.navigationBarThemeData,
    required super.dialogTheme,
    required super.dividerTheme,
  });

  factory BlindThemeData.light() {
    return BlindThemeData(
      appBarTheme: BlindAppBarTheme.light(),
      textTheme: const BlindTextTheme(),
      colorScheme: BlindColorScheme.light(),
      navigationBarThemeData: BlindNavigationBarThemeData.light(),
      dialogTheme: BlindDialogTheme.light(),
      dividerTheme: BlindDividerTheme.light(),
    );
  }

  factory BlindThemeData.dark() {
    return BlindThemeData(
      appBarTheme: BlindAppBarTheme.dark(),
      textTheme: const BlindTextTheme(),
      colorScheme: BlindColorScheme.dark(),
      navigationBarThemeData: BlindNavigationBarThemeData.dark(),
      dialogTheme: BlindDialogTheme.dark(),
      dividerTheme: BlindDividerTheme.dark(),
    );
  }
}

class BlindAppBarTheme extends ICoreAppBarTheme {
  const BlindAppBarTheme({
    required super.systemOverlayStyle,
    required super.primaryColor,
    required super.backgroundColor,
    super.toolbarHeight = 44.0,
    super.titleSpacing = 0.0,
    super.centerTitle = true,
  });

  factory BlindAppBarTheme.light() {
    return const BlindAppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      primaryColor: ColorName.gray800,
      backgroundColor: ColorName.white,
    );
  }

  factory BlindAppBarTheme.dark() {
    return const BlindAppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      primaryColor: ColorName.gray200,
      backgroundColor: ColorName.darkBlack,
    );
  }
}

class BlindTextTheme extends ICoreTextTheme {
  const BlindTextTheme();
}

extension on BlindTextTheme {
  TextStyle defaultTextStyleForSize(double size) => TextStyle(
    package: kToolBlindThemePackageName,
    fontFamily: FontFamily.pretendard,
    fontSize: size,
    height: size / size,
  );
}

extension BlindTextThemeDefaultExtension on BlindTextTheme {
  // w600
  TextStyle get default17SemiBold => defaultTextStyleForSize(17.0).toSemiBold();

  TextStyle get default16SemiBold => defaultTextStyleForSize(16.0).toSemiBold();

  TextStyle get default15SemiBold => defaultTextStyleForSize(15.0).toSemiBold();

  // w500
  TextStyle get default17Medium => defaultTextStyleForSize(17.0).toMedium();

  TextStyle get default15Medium => defaultTextStyleForSize(15.0).toMedium();

  TextStyle get default14Medium => defaultTextStyleForSize(14.0).toMedium();

  TextStyle get default13Medium => defaultTextStyleForSize(13.0).toMedium();

  TextStyle get default12Medium => defaultTextStyleForSize(12.0).toMedium();

  // w400
  TextStyle get default22Regular => defaultTextStyleForSize(22.0).toRegular();

  TextStyle get default17Regular => defaultTextStyleForSize(17.0).toRegular();

  TextStyle get default16Regular => defaultTextStyleForSize(16.0).toRegular();

  TextStyle get default15Regular => defaultTextStyleForSize(15.0).toRegular();

  TextStyle get default14Regular => defaultTextStyleForSize(14.0).toRegular();

  TextStyle get default13Regular => defaultTextStyleForSize(13.0).toRegular();

  TextStyle get default12Regular => defaultTextStyleForSize(12.0).toRegular();

  TextStyle get default11Regular => defaultTextStyleForSize(11.0).toRegular();

  // w300
  TextStyle get default13Light => defaultTextStyleForSize(13.0).toLight();

  TextStyle get default11Light => defaultTextStyleForSize(11.0).toLight();
}

extension on BlindTextTheme {
  TextStyle poppinsTextStyleForSize(double size) =>
      defaultTextStyleForSize(size).copyWith(fontFamily: FontFamily.poppins);
}

extension BlindTextThemePoppinsExtension on BlindTextTheme {
  // w700
  TextStyle get poppins30Bold => poppinsTextStyleForSize(30.0).toBold();

  TextStyle get poppins18Bold => poppinsTextStyleForSize(18.0).toBold();
}

extension on TextStyle {
  TextStyle toBold() => copyWith(fontWeight: FontWeight.w700);

  TextStyle toSemiBold() => copyWith(fontWeight: FontWeight.w600);

  TextStyle toMedium() => copyWith(fontWeight: FontWeight.w500);

  TextStyle toRegular() => copyWith(fontWeight: FontWeight.w400);

  TextStyle toLight() => copyWith(fontWeight: FontWeight.w300);
}

class BlindColorScheme extends ICoreColorScheme {
  BlindColorScheme({required super.brightness});

  factory BlindColorScheme.light() {
    return BlindColorScheme(brightness: Brightness.light);
  }

  factory BlindColorScheme.dark() {
    return BlindColorScheme(brightness: Brightness.dark);
  }

  bool get isDarkMode => brightness == Brightness.dark;

  Color get white => isDarkMode ? ColorName.white : ColorName.black;

  Color get black => isDarkMode ? ColorName.black : ColorName.white;

  Color get darkBlack => isDarkMode ? ColorName.darkBlack : ColorName.white;

  Color get lightBlack => isDarkMode ? ColorName.lightBlack : ColorName.white;

  Color get darkGray => isDarkMode ? ColorName.darkGray : ColorName.lightGray;

  Color get bg => isDarkMode ? ColorName.bg : ColorName.bg2;

  Color get bg2 => isDarkMode ? ColorName.bg2 : ColorName.bg;

  Color get gray100 => isDarkMode ? ColorName.gray100 : ColorName.gray900;

  Color get gray200 => isDarkMode ? ColorName.gray200 : ColorName.gray800;

  Color get gray300 => isDarkMode ? ColorName.gray300 : ColorName.gray700;

  Color get gray400 => isDarkMode ? ColorName.gray400 : ColorName.gray600;

  Color get gray500 => isDarkMode ? ColorName.gray500 : ColorName.gray500;

  Color get gray600 => isDarkMode ? ColorName.gray600 : ColorName.gray400;

  Color get gray700 => isDarkMode ? ColorName.gray700 : ColorName.gray300;

  Color get gray800 => isDarkMode ? ColorName.gray800 : ColorName.gray200;

  Color get gray900 => isDarkMode ? ColorName.gray900 : ColorName.gray100;
}

class BlindNavigationBarThemeData extends ICoreNavigationBarThemeData {
  const BlindNavigationBarThemeData({
    required super.backgroundColor,
    super.height = 58.0,
  });

  factory BlindNavigationBarThemeData.light() {
    return const BlindNavigationBarThemeData(backgroundColor: ColorName.white);
  }

  factory BlindNavigationBarThemeData.dark() {
    return const BlindNavigationBarThemeData(
      backgroundColor: ColorName.darkBlack,
    );
  }
}

class BlindDialogTheme extends ICoreDialogTheme {
  const BlindDialogTheme({
    required super.titleTextStyle,
    required super.backgroundColor,
    required super.confirmTextStyle,
    required super.confirmBackgroundColor,
    required super.cancelTextStyle,
    required super.cancelBackgroundColor,
  });

  factory BlindDialogTheme.light() {
    const BlindTextTheme data = BlindTextTheme();
    return BlindDialogTheme(
      titleTextStyle: data.default15Medium.copyWith(color: ColorName.gray800),
      backgroundColor: ColorName.gray200,
      confirmTextStyle: data.default15SemiBold.copyWith(color: ColorName.black),
      confirmBackgroundColor: ColorName.gray400,
      cancelTextStyle: data.default15Medium.copyWith(color: ColorName.gray800),
      cancelBackgroundColor: ColorName.gray200,
    );
  }

  factory BlindDialogTheme.dark() {
    const BlindTextTheme data = BlindTextTheme();
    return BlindDialogTheme(
      titleTextStyle: data.default15Medium.copyWith(color: ColorName.gray200),
      backgroundColor: ColorName.gray800,
      confirmTextStyle: data.default16SemiBold.copyWith(color: ColorName.white),
      confirmBackgroundColor: ColorName.gray600,
      cancelTextStyle: data.default15Medium.copyWith(color: ColorName.gray200),
      cancelBackgroundColor: ColorName.gray800,
    );
  }
}

class BlindDividerTheme extends ICoreDividerTheme {
  const BlindDividerTheme({required super.color});

  factory BlindDividerTheme.light() {
    return const BlindDividerTheme(color: ColorName.gray200);
  }

  factory BlindDividerTheme.dark() {
    return const BlindDividerTheme(color: ColorName.gray800);
  }
}

extension BlindThemeDataExtension on BuildContext {
  BlindThemeData get themeData {
    return BlindTheme.of(this);
  }

  BlindAppBarTheme get appBarTheme {
    return themeData.appBarTheme as BlindAppBarTheme;
  }

  BlindTextTheme get textTheme {
    return themeData.textTheme as BlindTextTheme;
  }

  BlindColorScheme get colorScheme {
    return themeData.colorScheme as BlindColorScheme;
  }

  BlindNavigationBarThemeData get navigationBarThemeData {
    return themeData.navigationBarThemeData as BlindNavigationBarThemeData;
  }

  BlindDialogTheme get dialogTheme {
    return themeData.dialogTheme as BlindDialogTheme;
  }

  BlindDividerTheme get dividerTheme {
    return themeData.dividerTheme as BlindDividerTheme;
  }
}
