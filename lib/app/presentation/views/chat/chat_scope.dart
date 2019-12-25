import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/widget_scope.dart';
import '../../../model/profile.dart';
import '../../app/yo_app_scope.dart';
import 'reactions/on_init_reaction.dart';
import 'reactions/on_back_reaction.dart';
import 'reactions/on_send_message_reaction.dart';
import 'reactions/on_receive_message_reaction.dart';
import 'chat_model.dart';

class ChatScope extends WidgetScope<YoAppScope, Profile, void, ChatModel> {

  OnInitReaction onInitReaction;
  OnBackReaction onBackReaction;
  OnSendMessageReaction onSendMessageReaction;
  OnReceiveMessageReaction onReceiveMessageReaction;

  ChatScope(ScopeBundle<YoAppScope, Profile, void, ChatModel> bundle) : super(bundle) {
    onInitReaction = OnInitReaction(viewModel, appScope.getRemoteMessagesTask);
    onBackReaction = OnBackReaction(trace);
    onSendMessageReaction = OnSendMessageReaction(viewModel, appScope.sendMessageTask);
    onReceiveMessageReaction = OnReceiveMessageReaction(viewModel);
  }

  @override
  void onConfigure() {
    appScope.onReceiveMessageEmitter.addReaction(onReceiveMessageReaction);
  }

  @override
  void onDeconfigure() {
    appScope.onReceiveMessageEmitter.removeReaction(onReceiveMessageReaction);
  }
}
