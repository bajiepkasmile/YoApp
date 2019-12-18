import '../../../architecture/presentation/view/view_model.dart';
import 'view_state.dart';

class WidgetModel extends ViewModel {

  final ViewState _viewState;

  WidgetModel(this._viewState);

  @override
  void refresh() => _viewState.rebuild();
}
