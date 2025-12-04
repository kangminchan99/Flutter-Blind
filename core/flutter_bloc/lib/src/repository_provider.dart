import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowRepositoryProvider<DataT> extends RepositoryProvider<DataT> {
  FlowRepositoryProvider({
    super.key,
    required super.create,
    super.child,
    super.lazy,
  });

  FlowRepositoryProvider.value({super.key, required super.value, super.child})
    : super.value();

  static DataT of<DataT>(BuildContext context, {bool listen = false}) {
    return RepositoryProvider.of<DataT>(context, listen: listen);
  }
}

extension FlowRepositoryRoviderContext on BuildContext {
  DataT readFlowRepository<DataT>() {
    return read<DataT>();
  }

  DataT watchFlowRepository<DataT>() {
    return watch<DataT>();
  }
}
