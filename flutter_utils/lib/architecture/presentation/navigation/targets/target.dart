import 'dart:async';

import 'package:flutter/widgets.dart';

abstract class Target {

  Future<TResult> add<TResult>(WidgetBuilder builder);

  Future<TResult> replace<TResult>(WidgetBuilder builder);

  void pop<TResult>(TResult result);
}
