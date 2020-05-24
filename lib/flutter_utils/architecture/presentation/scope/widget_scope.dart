import 'package:flutter/widgets.dart';

import '../../../../flutter_utils/architecture/presentation/navigation/targets/navigator/navigator_target.dart';
import '../../../../architecture/presentation/navigation/route_trace.dart';
import '../../../../architecture/presentation/scope/scope.dart';
import '../../../../architecture/presentation/view/view_model.dart';
import 'scope_bundle.dart';

abstract class WidgetScope<TAppScope extends Scope, TViewModel extends ViewModel, TArg, TResult> extends Scope {

  final BuildContext context;
  final TAppScope appScope;
  final TViewModel model;
  final TArg arg;
  final RouteTrace<TResult> trace;
  final NavigatorTarget navigatorTarget;

  WidgetScope(ScopeBundle<TAppScope, TViewModel, TArg, TResult> bundle) :
        context = bundle.context,
        appScope = bundle.routeBundle.appScope,
        model = bundle.viewModel,
        arg = bundle.routeBundle.arg,
        trace = bundle.routeBundle.trace,
        navigatorTarget = NavigatorTarget(bundle.context)
  ;
}
