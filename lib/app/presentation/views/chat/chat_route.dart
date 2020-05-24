import 'package:flutter/widgets.dart';
import 'package:yo_app/app/models/chat.dart';

import '../../../../flutter_utils/architecture/presentation/navigation/target_route.dart';
import '../../../../flutter_utils/architecture/presentation/navigation/targets/target.dart';
import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../models/profile.dart';
import '../../app/yo_app_scope.dart';
import 'chat_state.dart';

class ChatRoute extends TargetRoute<YoAppScope, Chat, void> {

  ChatRoute(YoAppScope appScope, Target target) : super(appScope, target);

  @override
  State<StatefulWidget> createState(RouteBundle<YoAppScope, Chat, void> bundle) => ChatState(bundle);
}
