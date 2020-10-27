import 'package:architecture/presentation/navigation/route_bundle.dart';
import 'package:architecture/presentation/view/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_utils/architecture/presentation/scope/app_scope.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/scope/widget_scope.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';

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
