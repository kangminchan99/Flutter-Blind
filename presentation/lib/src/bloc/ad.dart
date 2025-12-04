import 'package:core_bloc/bloc.dart';
import 'package:core_util/util.dart';
import 'package:domain/domain.dart';

class AdCubit extends IFlowCubit<String> {
  final GetAdImageUseCase _getAdImageUseCase;

  AdCubit(this._getAdImageUseCase);

  Future<void> load() async {
    emitLoading();
    try {
      final String value = await _getAdImageUseCase.excute();
      if (value.isWebUrl) {
        emitData(value);
        await Future.delayed(const Duration(seconds: 30));
      } else {
        emitEmpty();
      }
    } catch (e, s) {
      emitError(e, s);
    }
  }
}
