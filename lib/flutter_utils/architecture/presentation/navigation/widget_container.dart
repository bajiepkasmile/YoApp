import 'dart:collection';

import 'package:flutter/widgets.dart';

//TODO: сделать ContainerWidget
class WidgetContainer {

  final _widgetQueue = Queue<Widget>();

  Widget get widget => _widgetQueue.first;

  void add(Widget widget) => _widgetQueue.addFirst(widget);

  void replace(Widget widget) {
    if (_widgetQueue.isNotEmpty) {
      _widgetQueue.removeFirst();
    }
    _widgetQueue.addFirst(widget);
  }

  void pop() => _widgetQueue.removeFirst();

  void clear() => _widgetQueue.clear();
}
