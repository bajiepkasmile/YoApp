import 'package:flutter/material.dart';

import '../../../dart_utils/color_extension.dart';

class InitialsCircleAvatar extends StatelessWidget {
  
  final String name;

  InitialsCircleAvatar(this.name);

  @override
  Widget build(BuildContext context) =>
      CircleAvatar(
          radius: 30,
          backgroundColor: ColorExtension.fromRandomString(name, start: 90, end: 220),
          child: Text(
              _nameToInitials(name),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600)
          )
      );

  String _nameToInitials(String name) {
    final parts = name.toUpperCase().split(" ");
    if (parts.length == 1) {
      return parts.first.substring(0, 2);
    } else {
      return parts[0].substring(0, 1) + parts[1].substring(0, 1);
    }
  }
}
