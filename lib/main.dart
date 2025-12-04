import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tool_blind_theme/theme.dart';
import 'package:ui/ui.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await ICoreFirebase.initialize();
  runApp(const BlindApp());
}

class BlindApp extends StatefulWidget {
  const BlindApp({super.key});

  @override
  State<BlindApp> createState() => _BlindAppState();
}

class _BlindAppState extends State<BlindApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlindTheme(
      themeData: BlindThemeData.dark(),
      child: MaterialApp(
        title: 'Blind',
        themeMode: ThemeMode.dark,
        localizationsDelegates: [...GlobalMaterialLocalizations.delegates],
        supportedLocales: [Locale('ko')],
        initialRoute: BlindRouter.root.path,
        onGenerateRoute: IBlindRoutes.find,
      ),
    );
  }
}
