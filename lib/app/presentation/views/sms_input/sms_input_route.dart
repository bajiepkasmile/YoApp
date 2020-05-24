import 'package:flutter/widgets.dart';

import '../../../../flutter_utils/architecture/presentation/navigation/target_route.dart';
import '../../../../flutter_utils/architecture/presentation/navigation/targets/target.dart';
import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../app/yo_app_scope.dart';
import 'sms_input_arg.dart';
import 'sms_input_state.dart';

class SmsInputRoute extends TargetRoute<YoAppScope, SmsInputArg, void> {

  SmsInputRoute(YoAppScope appScope, Target target) : super(appScope, target);

  @override
  State<StatefulWidget> createState(RouteBundle<YoAppScope, SmsInputArg, void> bundle) => SmsInputState(bundle);
}
