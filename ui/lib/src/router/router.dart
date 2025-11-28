import 'package:flutter/material.dart';
import 'package:ui/src/screen/home.dart';

enum BlindRouter {
  root,
  unknown;

  static String encode(BlindRouter value) => value.path;

  static BlindRouter decode(String value) => BlindRouter.values.firstWhere(
    (element) => element.path == value,
    orElse: () => BlindRouter.unknown,
  );
}

extension BlindRouterExtension on BlindRouter {
  String get path {
    const String root = '/';
    if (this == BlindRouter.root) return root;
    return '$root$name';
  }
}

abstract class IBlindRoutes {
  static Route<dynamic> find(RouteSettings settings) {
    final Uri uri = Uri.tryParse(settings.name ?? '') ?? Uri();
    final Map<String, String> queryParameters = {...uri.queryParameters};
    final bool fullScreenDialog =
        bool.tryParse(queryParameters['fullScreenDialog'] ?? '') ?? false;
    return MaterialPageRoute(
      builder: (context) => findScreen(uri),
      settings: settings,
      fullscreenDialog: fullScreenDialog,
    );
  }

  static Widget findScreen(Uri uri) {
    final BlindRouter route = BlindRouter.decode(uri.path);
    switch (route) {
      case BlindRouter.root:
        return const HomeScreen();
      case BlindRouter.unknown:
        return const SizedBox.shrink();
    }
  }
}

abstract class IBlindRouteTo {
  // pushNamed() – path + query 파라미터 + fullScreenDialog 옵션으로 화면 이동
  static Future<T?> pushNamed<T extends Object?>(
    BuildContext context, {
    required String path,
    Map<String, String>? queryParameters,
    bool fullScreenDialog = false,
  }) async {
    final Map<String, String> params = {
      if (queryParameters != null) ...queryParameters,
      'fullScreenDialog': fullScreenDialog.toString(),
    };

    final Uri uri = Uri(path: path, queryParameters: params);

    final Object? result = await Navigator.of(
      context,
    ).pushNamed<Object?>(uri.toString());

    return result as T?;
  }

  // push() – BlindRouter enum을 path로 변환해서 pushNamed() 호출
  static Future<T?> push<T extends Object?>(
    BuildContext context, {
    required BlindRouter route,
    Map<String, String>? queryParameters,
    bool fullScreenDialog = false,
  }) async {
    return pushNamed(
      context,
      path: route.path,
      queryParameters: queryParameters,
      fullScreenDialog: fullScreenDialog,
    );
  }

  // BlindRouter.root 로 이동하는 단축 호출
  static Future<void> root(BuildContext context) async {
    return push<void>(context, route: BlindRouter.root);
  }
}
