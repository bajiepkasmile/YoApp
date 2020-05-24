import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../target.dart';

class NavigatorTarget extends Target {

  final BuildContext _context;

  NavigatorTarget(this._context);

  @override
  Future<TResult> add<TResult>(WidgetBuilder builder) => Navigator.push(_context, _createRoute(builder));

  @override
  Future<TResult> replace<TResult>(WidgetBuilder builder) => Navigator.pushReplacement(_context, _createRoute(builder));

  @override
  void pop<TResult>(TResult result) => Navigator.pop(_context);

  Route _createRoute(WidgetBuilder builder) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: builder);
    } else {
      return MaterialPageRoute(builder: builder);
    }
  }
}
