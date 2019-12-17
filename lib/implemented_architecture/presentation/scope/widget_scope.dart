import 'package:flutter/widgets.dart';

import '../../../architecture/presentation/view/view_model.dart';
import '../../../architecture/presentation/configurator/configurator.dart';
import '../../../architecture/presentation/navigation/route_trace.dart';
import '../../../architecture/presentation/scope/scope.dart';
import 'scope_bundle.dart';

abstract class WidgetScope<TAppScope extends Scope, TArg, TResult, TViewModel extends ViewModel> extends Scope {

  final BuildContext context;
  final TViewModel viewModel;
  final TAppScope appScope;
  final TArg arg;
  final RouteTrace<TResult> trace;

  Configurator configurator;

  WidgetScope(ScopeBundle<TAppScope, TArg, TResult, TViewModel> bundle) :
        context = bundle.context,
        viewModel = bundle.viewModel,
        appScope = bundle.routeBundle.appScope,
        arg = bundle.routeBundle.arg,
        trace = bundle.routeBundle.trace
  ;
}
