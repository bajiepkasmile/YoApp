import '../../../architecture/presentation/view/view_model.dart';
import 'view_state.dart';

class WidgetViewModel extends ViewModel {

  final ViewState _viewState;

  WidgetViewModel(this._viewState);

  @override
  void refresh() => _viewState.rebuild();
}
