import 'package:flutter/widgets.dart';

import '../../../../flutter_utils/architecture/presentation/navigation/target_route.dart';
import '../../../../flutter_utils/architecture/presentation/navigation/targets/target.dart';
import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../app/yo_app_scope.dart';
import 'phone_input_state.dart';

class PhoneInputRoute extends TargetRoute<YoAppScope, void, void> {

  PhoneInputRoute(YoAppScope appScope, Target target) : super(appScope, target);

  @override
  State<StatefulWidget> createState(RouteBundle<YoAppScope, void, void> bundle) => PhoneInputState(bundle);
}
