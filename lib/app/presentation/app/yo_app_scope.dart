import '../../../architecture/presentation/view/view_model.dart';
import '../../../implemented_architecture/presentation/scope/app_scope.dart';
import '../../../implemented_architecture/presentation/scope/scope_bundle.dart';

class YoAppScope extends AppScope<YoAppScope> {

  YoAppScope(ScopeBundle<YoAppScope, void, void, ViewModel> bundle) : super(bundle);
}
