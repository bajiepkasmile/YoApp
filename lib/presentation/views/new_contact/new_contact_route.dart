import 'package:architecture/presentation/navigation/route_bundle.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_utils/architecture/presentation/navigation/target_route.dart';
import 'package:flutter_utils/architecture/presentation/navigation/targets/target.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/views/new_contact/new_contact_state.dart';

class NewContactRoute extends TargetRoute<YoAppScope, void, void> {

  NewContactRoute(YoAppScope appScope, Target target) : super(appScope, target);

  @override
  State<StatefulWidget> createState(RouteBundle<YoAppScope, void, void> bundle) => NewContactState(bundle);
}
