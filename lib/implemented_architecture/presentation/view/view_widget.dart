import 'package:flutter/widgets.dart';

import '../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../architecture/presentation/view/view_model.dart';
import '../scope/app_scope.dart';
import '../scope/widget_scope.dart';
import '../scope/scope_bundle.dart';
import 'state_container.dart';
import 'view_state.dart';

abstract class ViewWidget<
    TAppScope extends AppScope<TAppScope>,
    TScope extends WidgetScope<TAppScope, TArg, TResult, TViewModel>,
    TArg,
    TResult,
    TViewModel extends ViewModel
> extends StatefulWidget {

  TScope get scope => stateContainer.state.scope;
  TViewModel get model => stateContainer.state.scope.viewModel;

  final stateContainer = StateContainer<TAppScope, TScope, TArg, TResult, TViewModel>();

  final RouteBundle<TAppScope, TArg, TResult> _routeBundle;

  ViewWidget(this._routeBundle);

  @override
  State createState() => ViewState<TAppScope, TScope, TArg, TResult, TViewModel>(_routeBundle);

  TScope createScope(ScopeBundle<TAppScope, TArg, TResult, TViewModel> bundle);

  TViewModel createViewModel(ViewState state, TArg arg);

  Widget build();

  void onInit() {
    //stub
  }

  void onDispose() {
    //stub
  }
}
