import 'package:core_flutter_bloc/flutter_bloc.dart';
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
}
