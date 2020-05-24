import 'dart:ui';

extension ColorExtension on Color {

  static Color fromRandomString(String str, {int start, int end}) {
    final hash = str.hashCode;

    var r = (hash & 0xFF0000) >> 16;
    var g = (hash & 0xFF00) >> 8;
    var b = hash & 0xFF;

    if (start != null || end != null) {
      r = _fitColorComponent(r, start, end);
      g = _fitColorComponent(g, start, end);
      b = _fitColorComponent(b, start, end);
    }

    return Color.fromARGB(0xFF, r, g, b);
  }

  static int _fitColorComponent(int component, int start, int end) {
    start ??= 0;
    end ??= 0;
    final range = end - start;
    while (component < start) component += range;
    while (component > end) component -= range;
    return component;
  }
}
