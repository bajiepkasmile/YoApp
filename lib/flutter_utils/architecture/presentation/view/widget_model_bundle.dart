import 'view_state.dart';

class WidgetModelBundle<TArg> {

  final TArg arg;
  final ViewState viewState;

  WidgetModelBundle(this.arg, this.viewState);
}
