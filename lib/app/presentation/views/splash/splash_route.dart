import 'package:flutter/widgets.dart';

import '../../../../flutter_utils/architecture/presentation/navigation/target_route.dart';
import '../../../../flutter_utils/architecture/presentation/navigation/targets/target.dart';
import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../app/yo_app_scope.dart';
import 'splash_state.dart';

class SplashRoute extends TargetRoute<YoAppScope, void, void> {

  SplashRoute(YoAppScope appScope, Target target) : super(appScope, target);

  @override
  State<StatefulWidget> createState(RouteBundle<YoAppScope, void, void> bundle) => SplashState(bundle);
}
