import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowBlocSelector<
  BlocT extends BlocBase<IFlowState<DataT>>,
  DataT,
  Selector
>
    extends BlocSelector<BlocT, IFlowState<DataT>, Selector> {
  const FlowBlocSelector({
    super.key,
    required super.selector,
    required super.builder,
    super.bloc,
  });
}
