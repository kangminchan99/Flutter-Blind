import 'package:blind/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:tool_blind_theme/theme.dart';

Future<void> main() async {
  runApp(const BlindApp());
}

class BlindApp extends StatelessWidget {
  const BlindApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlindTheme(
      themeData: BlindThemeData.dark(),
      child: MaterialApp(
        title: 'Blind',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
