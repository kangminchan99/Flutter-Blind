import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:core_flutter_bloc/src/internal.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowBlocBuilder<BlocT extends BlocBase<IFlowState<DataT>>, DataT>
    extends BlocBuilder<BlocT, IFlowState<DataT>> {
  const FlowBlocBuilder({
    super.key,
    required super.builder,
    super.bloc,
    super.buildWhen,
  });

  factory FlowBlocBuilder.when({
    Key? key,
    BlocT? bloc,
    BlocWidgetBuilder<IdleState<DataT>>? idle,
    BlocWidgetBuilder<LoadingState<DataT>>? loading,
    BlocWidgetBuilder<LoadMoreState<DataT>>? loadMore,
    BlocWidgetBuilder<EmptyState<DataT>>? empty,
    BlocWidgetBuilder<DataState<DataT>>? data,
    BlocWidgetBuilder<ErrorState<DataT>>? error,
    BlocWidgetBuilder<IFlowState<DataT>>? orElse,
    BlocBuilderCondition<IFlowState<DataT>>? buildWhen,
  }) {
    return FlowBlocBuilder<BlocT, DataT>(
      key: key,
      bloc: bloc,
      builder: InternalFlowBlocBuilder.when(
        idle: idle,
        loading: loading,
        loadMore: loadMore,
        empty: empty,
        data: data,
        error: error,
        orElse: orElse,
      ),
      buildWhen: buildWhen,
    );
  }
}
