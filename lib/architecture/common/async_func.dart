abstract class AsyncFunc<TArg, TResult> {

  Future<TResult> call(TArg arg);
}
