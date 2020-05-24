import '../../../../flutter_utils/architecture/presentation/navigation/targets/queue/queue_target.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/widget_scope.dart';
import '../../app/yo_app_scope.dart';
import '../chat_list/chat_list_route.dart';
import '../contact_list/contact_list_route.dart';
import '../profile/profile_route.dart';
import 'reactions/on_init_reaction.dart';
import 'reactions/on_switch_tap_reaction.dart';
import 'main_model.dart';

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

    onInitReaction = OnInitReaction(contactListRoute);
    onSwitchTabReaction = OnSwitchTabReaction(model, profileRoute, chatListRoute, contactListRoute);
  }
}
