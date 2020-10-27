/// Реакция на любое событие.
abstract class Reaction<TArg> {

  void excite(TArg arg);
}
