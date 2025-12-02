import 'package:core_flutter_bloc/flutter_bloc.dart';
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
}
