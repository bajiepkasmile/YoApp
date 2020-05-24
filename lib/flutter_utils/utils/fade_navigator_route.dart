import 'package:flutter/widgets.dart';

class FadeNavigatorRoute extends PageRouteBuilder {

  FadeNavigatorRoute(WidgetBuilder builder) : super(
    pageBuilder: 
        (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => builder(context),
    transitionsBuilder:
        (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child
        ) => FadeTransition(opacity: secondaryAnimation, child: child),
  );
}
