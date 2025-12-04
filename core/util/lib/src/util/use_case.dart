abstract class IUseCase<T, Params> {
  Future<T> excute([Params params]);
}
