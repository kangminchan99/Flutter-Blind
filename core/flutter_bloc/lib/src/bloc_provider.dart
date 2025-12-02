import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowBlocProvider<BlocT extends BlocBase<IFlowState>>
    extends BlocProvider<BlocT> {
  const FlowBlocProvider({
    super.key,
    required super.create,
    super.child,
    super.lazy,
  });

  const FlowBlocProvider.value({super.key, required super.value, super.child})
    : super.value();

  static BlocT of<BlocT extends BlocBase<IFlowState>>(
    BuildContext context, {
    bool listen = false,
  }) {
    return BlocProvider.of<BlocT>(context, listen: listen);
  }
}
