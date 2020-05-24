import '../../../../architecture/presentation/view/view_model.dart';
import '../navigation/targets/queue/queue_target.dart';
import 'widget_scope.dart';
import 'scope_bundle.dart';

class AppScope<TSelf extends WidgetScope<TSelf, ViewModel, void, void>>
    extends WidgetScope<TSelf, ViewModel, void, void> {

  QueueTarget queueTarget;

  AppScope(ScopeBundle<TSelf, ViewModel, void, void> bundle) : super(bundle) {
    queueTarget = QueueTarget();
  }
}
