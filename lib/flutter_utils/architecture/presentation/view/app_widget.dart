import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../../architecture/presentation/view/view_model.dart';
import '../scope/app_scope.dart';
import 'widget_state.dart';
import 'widget_model_bundle.dart';
import 'widget_model.dart';

abstract class AppState<TAppScope extends AppScope<TAppScope>>
    extends WidgetState<TAppScope, TAppScope, ViewModel, void, void> {

  AppState() : super(RouteBundle(null, null, null));

  @override
  ViewModel createViewModel(WidgetModelBundle<void> bundle) => WidgetModel(bundle);
}
