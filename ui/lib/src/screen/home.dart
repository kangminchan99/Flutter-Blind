import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presentation/presentation.dart';
import 'package:tool_blind_components/component.dart';
import 'package:tool_blind_theme/theme.dart';
import 'package:ui/ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SplashScreen.show(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.darkBlack,
      body: FlowBlocBuilder<HomeTabCubit, int>.when(
        data: (context, state) => CoreTabSwitchingView(
          currentTabIndex: state.data!,
          tabCount: BlindNavigationType.values.length,
          tabBuilder: (context, index) {
            final Uri uri = switch (index) {
              0 => Uri(path: BlindRouter.community.path),
              _ => Uri(path: BlindRouter.community.path),
            };
            return IBlindRoutes.findScreen(uri);
          },
        ),
      ),
      bottomNavigationBar: FlowBlocBuilder<HomeTabCubit, int>.when(
        data: (context, state) => BlindBottomNavigationBar(
          items: BlindNavigationType.values
              .map((e) => BlindBottomNavigationItem(type: e))
              .toList(),
          currentIndex: state.data!,
          onTap: (index) =>
              context.readFlowBloc<HomeTabCubit>().change(index: index),
        ),
      ),
      floatingActionButton: FlowBlocBuilder<HomeTabCubit, int>.when(
        data: (context, state) {
          switch (state.data) {
            case 0:
            case 1:
              return BlindWriteButton(
                onTap: () {
                  // TODO: 글쓰기 화면으로 이동
                },
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
