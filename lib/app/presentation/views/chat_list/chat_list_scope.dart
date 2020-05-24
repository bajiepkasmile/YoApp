import '../../../../flutter_utils/architecture/presentation/reaction/simple_on_open_reaction.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/widget_scope.dart';
import '../../../models/chat.dart';
import '../../app/yo_app_scope.dart';
import '../chat/chat_route.dart';
import 'chat_list_model.dart';

class ChatListScope extends WidgetScope<YoAppScope, ChatListModel, void, void> {

  ChatRoute chatRoute;

  SimpleOnOpenReaction<Chat> onOpenChatReaction;

  ChatListScope(ScopeBundle<YoAppScope, ChatListModel, void, void> bundle) : super(bundle) {
    chatRoute = ChatRoute(appScope, navigatorTarget);

    onOpenChatReaction = SimpleOnOpenReaction(chatRoute);
  }

  @override
  void onConfigure() {
    model.contacts = appScope.contactsRepository.data;
  }
}
