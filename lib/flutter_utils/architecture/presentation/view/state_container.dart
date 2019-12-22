import '../../../../architecture/presentation/view/view_model.dart';
import '../scope/app_scope.dart';
import '../scope/widget_scope.dart';
import 'view_state.dart';

class StateContainer<
  TAppScope extends AppScope<TAppScope>,
  TScope extends WidgetScope<TAppScope, TArg, TResult, TViewModel>,
  TArg,
  TResult,
  TViewModel extends ViewModel
> {

  ViewState<TAppScope, TScope, TArg, TResult, TViewModel> state;
}
