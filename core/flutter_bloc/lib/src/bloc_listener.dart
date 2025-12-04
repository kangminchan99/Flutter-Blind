import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:core_flutter_bloc/src/internal.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowBlocListener<BlocT extends BlocBase<IFlowState<DataT>>, DataT>
    extends BlocListener<BlocT, IFlowState<DataT>> {
  const FlowBlocListener({
    super.key,
    required super.listener,
    super.bloc,
    super.listenWhen,
    super.child,
  });

  factory FlowBlocListener.when({
    Key? key,
    BlocT? bloc,
    BlocWidgetListener<IdleState<DataT>>? onIdle,
    BlocWidgetListener<LoadingState<DataT>>? onLoading,
    BlocWidgetListener<LoadMoreState<DataT>>? onLoadMore,
    BlocWidgetListener<EmptyState<DataT>>? onEmpty,
    BlocWidgetListener<DataState<DataT>>? onData,
    BlocWidgetListener<ErrorState<DataT>>? onError,
    BlocWidgetListener<IFlowState<DataT>>? onElse,
    BlocListenerCondition<IFlowState<DataT>>? listenWhen,
  }) {
    return FlowBlocListener<BlocT, DataT>(
      key: key,
      bloc: bloc,
      listener: InternalFlowBlocListener.when(
        onIdle: onIdle,
        onLoading: onLoading,
        onLoadMore: onLoadMore,
        onEmpty: onEmpty,
        onData: onData,
        onError: onError,
        onElse: onElse,
      ),
      listenWhen: listenWhen,
    );
  }
}
