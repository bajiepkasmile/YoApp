import 'dart:async';

abstract class ViewModel<TArg> {

  final TArg arg;

  Future<void> refreshFuture;

  ViewModel(this.arg);

  void refresh();

  void setRefreshFuture(Future<void> future) async {
    if (refreshFuture != null) {
      return;
    }
    refreshFuture = future;
    await future;
    refreshFuture = null;
  }
}
