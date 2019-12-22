abstract class AsyncCommon<TArg, TResult> {

  Future<TResult> call(TArg arg);
}
