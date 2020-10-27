import 'package:architecture/presentation/navigation/route.dart';
import 'package:architecture/presentation/navigation/route_bundle.dart';
import 'package:architecture/presentation/scope/scope.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' as Flutter;
import 'package:flutter_utils/architecture/presentation/common/state_widget.dart';
import 'package:flutter_utils/architecture/presentation/navigation/targets/target.dart';

abstract class TargetRoute<TAppScope extends Scope, TArg, TResult> extends Route<TArg, TResult> {

  final TAppScope _appScope;
  final Target _target;

  TargetRoute(this._appScope, this._target);

  @override
  Future<TResult> add(TArg arg) => _target.add(_createBuilder(arg));

  @override
  Future<TResult> replace(TArg arg)  => _target.replace(_createBuilder(arg));

  @override
  void pop(TResult result) => _target.pop(result);

  @protected
  Flutter.State<Flutter.StatefulWidget> createState(RouteBundle<TAppScope, TArg, TResult> bundle);

  Flutter.WidgetBuilder _createBuilder(TArg arg) {
    final routeBundle = RouteBundle(_appScope, arg, this);
    final state = createState(routeBundle);
    return (context) => StateWidget(state);
  }
}
