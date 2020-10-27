import 'package:flutter_utils/architecture/presentation/navigation/targets/queue/queue_target.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/scope/widget_scope.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/views/chat_list/chat_list_route.dart';
import 'package:yo_app/presentation/views/contact_list/contact_list_route.dart';
import 'package:yo_app/presentation/views/main/main_model.dart';
import 'package:yo_app/presentation/views/main/reactions/on_switch_tap_reaction.dart';
import 'package:yo_app/presentation/views/profile/profile_route.dart';

class MainScope extends WidgetScope<YoAppScope, MainModel, void, void> {

  QueueTarget queueTarget;

  ProfileRoute profileRoute;
  ChatListRoute chatListRoute;
  ContactListRoute contactListRoute;

  OnInitReaction onInitReaction;
  OnSwitchTabReaction onSwitchTabReaction;

  MainScope(ScopeBundle<YoAppScope, MainModel, void, void> bundle) : super(bundle) {
    queueTarget = QueueTarget();

    profileRoute = ProfileRoute(appScope, queueTarget);
    chatListRoute = ChatListRoute(appScope, queueTarget);
    contactListRoute = ContactListRoute(appScope, queueTarget);

    onInitReaction = OnInitReaction(contactListRoute); //replace
    onSwitchTabReaction = OnSwitchTabReaction(model, profileRoute, chatListRoute, contactListRoute);
  }
}
