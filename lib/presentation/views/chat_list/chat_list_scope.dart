import 'package:flutter_utils/architecture/presentation/reaction/simple_on_open_reaction.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/scope/widget_scope.dart';
import 'package:yo_app/models/chat.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/views/chat/chat_route.dart';
import 'package:yo_app/presentation/views/chat_list/chat_list_model.dart';

class ChatListScope extends WidgetScope<YoAppScope, ChatListModel, void, void> {

  ChatRoute chatRoute;

  SimpleOnOpenReaction<Chat> onOpenChatReaction;

  ChatListScope(ScopeBundle<YoAppScope, ChatListModel, void, void> bundle) : super(bundle) {
    chatRoute = ChatRoute(appScope, navigatorTarget);

    onOpenChatReaction = SimpleOnOpenReaction(chatRoute);
  }

  @override
  void onConfigure() {
    model.contacts = appScope.contactsBox.data;
  }
}
