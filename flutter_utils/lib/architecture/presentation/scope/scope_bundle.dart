import 'package:architecture/presentation/navigation/route_bundle.dart';
import 'package:architecture/presentation/scope/scope.dart';
import 'package:architecture/presentation/view/view_model.dart';
import 'package:flutter/widgets.dart';

class ScopeBundle<TAppScope extends Scope, TViewModel extends ViewModel, TArg, TResult> {

  final BuildContext context;
  final ViewModel viewModel;
  final RouteBundle<TAppScope, TArg, TResult> routeBundle;

  ScopeBundle(this.context, this.viewModel, this.routeBundle);
}
