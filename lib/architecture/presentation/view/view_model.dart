abstract class ViewModel<TArg> {

  final TArg arg;

  ViewModel(this.arg);

  void refresh();
}
