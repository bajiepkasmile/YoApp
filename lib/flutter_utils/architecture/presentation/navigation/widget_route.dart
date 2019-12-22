import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../architecture/presentation/scope/scope.dart';
import '../../../../architecture/presentation/navigation/route.dart' as Architecture;
import '../../../../architecture/presentation/navigation/route_bundle.dart';
import 'widget_container.dart';

abstract class WidgetRoute<TAppScope extends Scope, TArg, TResult> extends Architecture.Route<TArg, TResult> {

  final BuildContext _context;
  final TAppScope _appScope;
  final WidgetContainer _widgetContainer;

  Completer<TResult> _completer;

  WidgetRoute(this._context, this._appScope, this._widgetContainer);

  @override
  Future<TResult> follow(TArg arg) {
    if (_widgetContainer != null) {
      _completer = Completer<TResult>();
      _widgetContainer.add(_createBundledWidget(arg));
      return _completer.future;
    } else {
      return Navigator.push(_context, _createNavigatorRoute(arg));
    }
  }

  @override
  Future<TResult> followReplacement(TArg arg) {
    if (_widgetContainer != null) {
      _completer = Completer<TResult>();
      _widgetContainer.replace(_createBundledWidget(arg));
      return _completer.future;
    } else {
      return Navigator.pushReplacement(_context, _createNavigatorRoute(arg));
    }
  }

  @override
  void comeBack(TResult result) {
    if (_widgetContainer != null) {
      _widgetContainer.pop();
      _completer.complete(result);
    } else {
      Navigator.pop(_context, result);
    }
  }

  @protected
  Widget createWidget(RouteBundle<TAppScope, TArg, TResult> bundle);

  Route _createNavigatorRoute(TArg arg) {
    final widget = _createBundledWidget(arg);
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: (context) => widget);
    } else {
      return MaterialPageRoute(builder: (context) => widget);
    }
  }

  Widget _createBundledWidget(TArg arg) {
    final routeBundle = RouteBundle(_appScope, arg, this);
    return createWidget(routeBundle);
  }
}
