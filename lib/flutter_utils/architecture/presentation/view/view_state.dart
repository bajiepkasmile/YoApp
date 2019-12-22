import 'package:flutter/widgets.dart';

import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../../architecture/presentation/view/view_model.dart';
import '../scope/app_scope.dart';
import '../scope/widget_scope.dart';
import '../scope/scope_bundle.dart';
import 'view_widget.dart';

class ViewState<
    TAppScope extends AppScope<TAppScope>,
    TScope extends WidgetScope<TAppScope, TArg, TResult, TViewModel>,
    TArg,
    TResult,
    TViewModel extends ViewModel
> extends State<ViewWidget<TAppScope, TScope, TArg, TResult, TViewModel>> {

  TScope scope;

  final RouteBundle<TAppScope, TArg, TResult> _routeBundle;

  ViewState(this._routeBundle);

  @override
  Widget build(BuildContext context) {
    widget.stateContainer.state = this;
    return widget.build();
  }

  @override
  void initState() {
    super.initState();
    widget.stateContainer.state = this;
    scope = _createScope();
    scope.configurator?.configure();
    widget.onInit();
  }

  @override
  void dispose() {
    widget.onDispose();
    scope.configurator?.deconfigure();
    super.dispose();
  }

  void rebuild() => setState(() {});

  TScope _createScope() {
    final viewModel = widget.createViewModel(this, _routeBundle.arg);
    final scopeBundle = ScopeBundle<TAppScope, TArg, TResult, TViewModel>(context, viewModel, _routeBundle);
    return widget.createScope(scopeBundle);
  }
}
