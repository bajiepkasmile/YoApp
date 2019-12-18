import '../../../../implemented_architecture/presentation/scope/scope_bundle.dart';
import '../../../../implemented_architecture/presentation/scope/widget_scope.dart';
import '../../../model/profile.dart';
import '../../app/yo_app_scope.dart';
import 'reactions/on_init_reaction.dart';
import 'reactions/on_back_reaction.dart';
import 'reactions/on_send_message_reaction.dart';
import 'chat_model.dart';

class ChatScope extends WidgetScope<YoAppScope, Profile, void, ChatModel> {

  OnInitReaction onInitReaction;
  OnBackReaction onBackReaction;
  OnSendMessageReaction onSendMessageReaction;

  ChatScope(ScopeBundle<YoAppScope, Profile, void, ChatModel> bundle) : super(bundle) {
    onInitReaction = OnInitReaction(arg, viewModel, appScope.getRemoteMessagesOperation);
    onBackReaction = OnBackReaction(trace);
    onSendMessageReaction = OnSendMessageReaction(arg, viewModel, appScope.sendMessageOperation);
  }
}
