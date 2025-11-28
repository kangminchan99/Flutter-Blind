import 'package:blind/home_screen.dart';
import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tool_blind_theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ICoreFirebase.initialize();
  runApp(const BlindApp());
}

class BlindApp extends StatelessWidget {
  const BlindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlindTheme(
      themeData: BlindThemeData.dark(),
      child: MaterialApp(
        title: 'Blind',
        themeMode: ThemeMode.dark,
        localizationsDelegates: [...GlobalMaterialLocalizations.delegates],
        supportedLocales: [Locale('ko')],
        home: const HomeScreen(),
      ),
    );
  }
}
