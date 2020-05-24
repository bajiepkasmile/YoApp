import '../../../../architecture/presentation/view/view_model.dart';
import 'widget_model_bundle.dart';
import 'widget_state.dart';

class WidgetModel<TArg> extends ViewModel<TArg> {

  final WidgetState _viewState;

  WidgetModel(WidgetModelBundle<TArg> bundle) :
        _viewState = bundle.viewState,
        super(bundle.arg)
  ;

  @override
  void refresh() => _viewState.rebuild();
}
