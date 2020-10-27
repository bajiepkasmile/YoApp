import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_utils/architecture/presentation/navigation/targets/target.dart';

class ImageSourceTarget extends Target {

  final BuildContext _context;

  ImageSourceTarget(this._context);

  @override
  Future<TResult> add<TResult>(WidgetBuilder builder) {
    if (Platform.isIOS) {
      return showModalBottomSheet(context: _context, builder: builder, backgroundColor: Colors.transparent);
    } else {
      return showDialog(context: _context, builder: builder);
    }
  }

  @override
  Future<TResult> replace<TResult>(WidgetBuilder builder) => throw UnsupportedError("");

  @override
  void pop<TResult>(TResult result) => Navigator.pop(_context, result);
}
