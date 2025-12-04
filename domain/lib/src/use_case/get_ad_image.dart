import 'package:core_util/util.dart';
import 'package:domain/domain.dart';

class GetAdImageUseCase implements IUseCase<String, void> {
  final IFirebaseRepo _firebaseRepo;

  GetAdImageUseCase(this._firebaseRepo);

  @override
  Future<String> excute([void params]) {
    return _firebaseRepo.getAdImage();
  }
}
