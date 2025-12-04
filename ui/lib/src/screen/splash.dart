import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:tool_blind_components/component.dart';
import 'package:tool_blind_theme/gen/gen.dart';
import 'package:tool_blind_theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  static Future<void> show(BuildContext context) {
    return showGeneralDialog<void>(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SplashBlocProvider(child: SplashScreen()),
      barrierColor: Colors.transparent,
      transitionDuration: Duration.zero,
    );
  }
}

class _SplashScreenState extends State<SplashScreen> {
  final ValueNotifier<double> _opacityNotifier = ValueNotifier<double>(1.0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.readFlowBloc<AdCubit>().load();
      _hideAfterDelay(const Duration(seconds: 2));
    });
  }

  @override
  void dispose() {
    _opacityNotifier.dispose();
    super.dispose();
  }

  Future<void> _hideAfterDelay(Duration delay) async {
    await Future.delayed(delay);
    _updateOpacity(0.0);
  }

  void _updateOpacity(double value) {
    if (_opacityNotifier.value == value) return;
    _opacityNotifier.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: _opacityNotifier,
      builder: (context, opacity, child) => AnimatedOpacity(
        opacity: opacity,
        duration: Duration(milliseconds: 500),
        child: Scaffold(
          backgroundColor: ColorName.splashBackground,
          body: SizedBox.expand(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlindIcon.logo(size: 46.0),
                    SizedBox(height: 14),
                    Text(
                      'Blind',
                      style: context.textTheme.poppins18Bold.copyWith(
                        color: ColorName.white,
                        fontSize: 24.0,
                        height: 24.0 / 24.0,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Stack(
                    children: [
                      FlowBlocConsumer<AdCubit, String>.when(
                        data: (context, state) => SizedBox(
                          width: double.infinity,
                          child: Image.network(state.data!, fit: BoxFit.cover),
                        ),
                        onData: (context, state) =>
                            _hideAfterDelay(const Duration(seconds: 3)),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 48.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              stops: [0, 0.5],
                              colors: [
                                ColorName.splashBackground,
                                ColorName.splashBackground.withValues(
                                  alpha: 0.0,
                                ),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
