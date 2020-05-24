import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../../architecture/presentation/view/view_model.dart';
import '../scope/app_scope.dart';
import '../scope/widget_scope.dart';
import '../scope/scope_bundle.dart';
import 'widget_model_bundle.dart';

abstract class WidgetState<
    TAppScope extends AppScope<TAppScope>,
    TScope extends WidgetScope<TAppScope, TViewModel, TArg, TResult>,
    TViewModel extends ViewModel,
    TArg,
    TResult
> extends State<StatefulWidget> {

  @protected
  ThemeData theme;
  @protected
  TScope scope;
  @protected
  TViewModel get model => scope.model;

  final RouteBundle<TAppScope, TArg, TResult> _routeBundle;

  WidgetState(this._routeBundle);

  void rebuild() => setState(() {});

  @protected
  TScope createScope(ScopeBundle<TAppScope, TViewModel, TArg, TResult> bundle);

  @protected
  TViewModel createViewModel(WidgetModelBundle<TArg> bundle);

  @override
  void initState() {
    super.initState();
    scope = _createScope();
    scope.onConfigure();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
  }

  @override
  void dispose() {
    scope.onDeconfigure();
    super.dispose();
  }

  TScope _createScope() {
    final viewModel = _createViewModel();
    final scopeBundle = ScopeBundle<TAppScope, TViewModel, TArg, TResult>(context, viewModel, _routeBundle);
    return createScope(scopeBundle);
  }

  TViewModel _createViewModel() {
    final modelBundle = WidgetModelBundle<TArg>(_routeBundle.arg, this);
    return createViewModel(modelBundle);
  }
}
