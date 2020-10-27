import 'package:flutter_utils/architecture/presentation/view/widget_state.dart';

class WidgetModelBundle<TArg> {

  final TArg arg;
  final WidgetState viewState;

  WidgetModelBundle(this.arg, this.viewState);
}
