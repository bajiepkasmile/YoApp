import 'package:architecture/presentation/view/view_model.dart';
import 'package:flutter_utils/architecture/presentation/navigation/targets/queue/queue_target.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/scope/widget_scope.dart';

class AppScope<TSelf extends WidgetScope<TSelf, ViewModel, void, void>>
    extends WidgetScope<TSelf, ViewModel, void, void> {

  QueueTarget queueTarget;

  AppScope(ScopeBundle<TSelf, ViewModel, void, void> bundle) : super(bundle) {
    queueTarget = QueueTarget();
  }
}
