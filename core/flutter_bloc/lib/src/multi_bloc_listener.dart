import 'package:flutter_bloc/flutter_bloc.dart';

class FlowMultiBlocListener extends MultiBlocListener {
  FlowMultiBlocListener({
    super.key,
    required super.listeners,
    required super.child,
  });
}
