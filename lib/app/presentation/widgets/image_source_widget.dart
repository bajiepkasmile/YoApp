//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//
//import 'package:yo_app/architecture/presentation/navigation/route.dart';
//
//abstract class DialogRoute<TArg, TResult> extends Route<TArg, TResult> {
//
//  final BuildContext _context;
//
//  DialogRoute(this._context);
//
//  @override
//  Future<TResult> follow(TArg arg) => showDialog(context: _context, builder: (BuildContext context) => createWidget());
//
//  @override
//  Future<TResult> followReplacement(TArg arg) => throw UnsupportedError("DialogRoute can not followReplacement");
//
//  @override
//  void comeBack(TResult result) => Navigator.pop(_context, result);
//
//  @protected
//  Widget createWidget();
//}
//
//class ImageSourceRoute extends DialogRoute<void, ImageSource> {
//
//  ImageSourceRoute(BuildContext context) : super(context);
//
//  @override
//  Widget createWidget() => AlertDialog(
//    content: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: <Widget>[
//          Text('Open camera'),
//          Text('Open gallery'),
//        ]
//    ),
//  );
//}