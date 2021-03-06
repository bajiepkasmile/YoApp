import 'package:architecture/presentation/navigation/route_bundle.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_utils/architecture/presentation/navigation/target_route.dart';
import 'package:flutter_utils/architecture/presentation/navigation/targets/target.dart';
import 'package:yo_app/models/chat.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/views/chat/chat_state.dart';

class ChatRoute extends TargetRoute<YoAppScope, Chat, void> {

  ChatRoute(YoAppScope appScope, Target target) : super(appScope, target);

  @override
  State<StatefulWidget> createState(RouteBundle<YoAppScope, Chat, void> bundle) => ChatState(bundle);
}
