import '../../../architecture/presentation/view/view_model.dart';
import '../navigation/widget_container.dart';
import 'widget_scope.dart';
import 'scope_bundle.dart';

class AppScope<TSelf extends WidgetScope<TSelf, void, void, ViewModel>>
    extends WidgetScope<TSelf, void, void, ViewModel> {

  WidgetContainer screenContainer = WidgetContainer();

  AppScope(ScopeBundle<TSelf, void, void, ViewModel> bundle) : super(bundle);
}
