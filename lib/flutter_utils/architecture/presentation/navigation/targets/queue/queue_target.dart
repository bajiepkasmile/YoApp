import 'dart:async';
import 'dart:collection';

import 'package:flutter/widgets.dart';

import '../target.dart';

class QueueTarget extends Target {

  bool get isEmpty => _queue.isEmpty;
  WidgetBuilder get builder => _queue.first.builder;
  Stream get onChangeStream => _streamController.stream;

  final _queue = Queue<_QueueTargetItem>();
  final _streamController = StreamController();

  @override
  Future<TResult> add<TResult>(WidgetBuilder builder) {
    final item = _createItem(builder);
    _queue.addFirst(item);
    _notify();
    return item.completer.future as Future<TResult>;
  }

  @override
  Future<TResult> replace<TResult>(WidgetBuilder builder) {
    final item = _createItem(builder);
    if (_queue.isNotEmpty) {
      _queue.removeFirst();
    }
    _queue.addFirst(item);
    _notify();
    return item.completer.future as Future<TResult>;
  }

  @override
  void pop<TResult>(TResult result) {
    _queue.removeFirst().completer.complete(result);
    _notify();
  }

  void _notify() => _streamController.add(null);

  _QueueTargetItem _createItem(WidgetBuilder builder) {
    final completer = Completer();
    return _QueueTargetItem(builder, completer);
  }
}

class _QueueTargetItem {

  final WidgetBuilder builder;
  final Completer completer;

  _QueueTargetItem(this.builder, this.completer);
}
