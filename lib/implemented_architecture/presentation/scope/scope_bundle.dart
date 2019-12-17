import 'package:flutter/widgets.dart';

import '../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../architecture/presentation/scope/scope.dart';
import '../../../architecture/presentation/view/view_model.dart';

class ScopeBundle<TAppScope extends Scope, TArg, TResult, TViewModel extends ViewModel> {

  final BuildContext context;
  final ViewModel viewModel;
  final RouteBundle<TAppScope, TArg, TResult> routeBundle;

  ScopeBundle(this.context, this.viewModel, this.routeBundle);
}
