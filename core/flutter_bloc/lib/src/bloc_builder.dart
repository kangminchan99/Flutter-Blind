import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowBlocBuilder<BlocT extends BlocBase<IFlowState<DataT>>, DataT>
    extends BlocBuilder<BlocT, IFlowState<DataT>> {
  const FlowBlocBuilder({
    super.key,
    required super.builder,
    super.bloc,
    super.buildWhen,
  });
}
