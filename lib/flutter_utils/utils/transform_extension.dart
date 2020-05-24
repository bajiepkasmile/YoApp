import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension TransformExtension on Transform {

  static Transform flip(Widget child) =>
      Transform(child: child, transform: Matrix4.rotationY(pi), alignment: Alignment.center);
}
