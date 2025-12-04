import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowBlocConsumer<BlocT extends BlocBase<IFlowState<DataT>>, DataT>
    extends BlocConsumer<BlocT, IFlowState<DataT>> {
  const FlowBlocConsumer({
    super.key,
    required super.builder,
    required super.listener,
    super.bloc,
    super.buildWhen,
    super.listenWhen,
  });

  factory FlowBlocConsumer.when({
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
    BlocWidgetListener<IdleState<DataT>>? onIdle,
    BlocWidgetListener<LoadingState<DataT>>? onLoading,
    BlocWidgetListener<LoadMoreState<DataT>>? onLoadMore,
    BlocWidgetListener<EmptyState<DataT>>? onEmpty,
    BlocWidgetListener<DataState<DataT>>? onData,
    BlocWidgetListener<ErrorState<DataT>>? onError,
    BlocWidgetListener<IFlowState<DataT>>? onElse,
    BlocListenerCondition<IFlowState<DataT>>? listenWhen,
  }) {
    return FlowBlocConsumer<BlocT, DataT>(
      key: key,
      bloc: bloc,
      builder: (context, state) {
        if (idle != null && state is IdleState<DataT>) {
          return idle(context, state);
        } else if (loading != null && state is LoadingState<DataT>) {
          return loading(context, state);
        } else if (loadMore != null && state is LoadMoreState<DataT>) {
          return loadMore(context, state);
        } else if (empty != null && state is EmptyState<DataT>) {
          return empty(context, state);
        } else if (data != null && state is DataState<DataT>) {
          return data(context, state);
        } else if (error != null && state is ErrorState<DataT>) {
          return error(context, state);
        } else if (orElse != null) {
          return orElse(context, state);
        }
        return const SizedBox.shrink();
      },

      listener: (context, state) {
        if (onIdle != null && state is IdleState<DataT>) {
          onIdle(context, state);
        } else if (onLoading != null && state is LoadingState<DataT>) {
          onLoading(context, state);
        } else if (onLoadMore != null && state is LoadMoreState<DataT>) {
          onLoadMore(context, state);
        } else if (onEmpty != null && state is EmptyState<DataT>) {
          onEmpty(context, state);
        } else if (onData != null && state is DataState<DataT>) {
          onData(context, state);
        } else if (onError != null && state is ErrorState<DataT>) {
          onError(context, state);
        } else if (onElse != null) {
          onElse(context, state);
        }
      },
      listenWhen: listenWhen,
      buildWhen: buildWhen,
    );
  }
}
