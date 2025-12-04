import 'package:data/data.dart';
import 'package:domain/domain.dart';

class FirebaseRepo implements IFirebaseRepo {
  final FirebaseDataSource _firebaseDataSource;

  FirebaseRepo(this._firebaseDataSource);

  @override
  Future<String> getAdImage() {
    return _firebaseDataSource.getAdImage();
  }
}
