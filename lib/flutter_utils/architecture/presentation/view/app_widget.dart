import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../../architecture/presentation/view/view_model.dart';
import '../scope/app_scope.dart';
import 'view_state.dart';
import 'widget_model.dart';
import 'view_widget.dart';

abstract class AppWidget<TAppScope extends AppScope<TAppScope>>
    extends ViewWidget<TAppScope, TAppScope, void, void, ViewModel> {

  AppWidget() : super(RouteBundle(null, null, null));

  @override
  ViewModel createViewModel(ViewState state, void arg) => WidgetModel(state);
}
