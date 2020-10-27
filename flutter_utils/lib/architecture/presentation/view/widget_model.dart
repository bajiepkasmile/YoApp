import 'package:architecture/presentation/view/view_model.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_state.dart';

class WidgetModel<TArg> extends ViewModel<TArg> {

  final WidgetState _viewState;

  WidgetModel(WidgetModelBundle<TArg> bundle) :
        _viewState = bundle.viewState,
        super(bundle.arg)
  ;

  @override
  void refresh() => _viewState.rebuild();
}
