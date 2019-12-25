import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../data/tasks/messages/send_message_task.dart';
import '../../../../model/message.dart';
import '../../../../model/message_status.dart';
import '../chat_model.dart';

class OnSendMessageReaction extends Reaction<void> {

  final ChatModel _chatModel;
  final SendMessageTask _sendMessageTask;

  OnSendMessageReaction(this._chatModel, this._sendMessageTask);

  @override
  void excite(void arg) async {
    final sendingMessage = Message(null, null, _chatModel.arg.id, MessageStatus.sending, true);
    _chatModel.messages.insert(0, sendingMessage);
    _chatModel.refresh();

    final sentMessage = await _sendMessageTask.execute(_chatModel.arg.id);
    _replaceMessage(sendingMessage, sentMessage);
    _chatModel.refresh();
  }

  void _replaceMessage(Message replacingMessage, Message newMessage) {
    final messages = _chatModel.messages;
    final messageIndex = messages.indexOf(replacingMessage);
    messages.removeAt(messageIndex);
    messages.insert(messageIndex, newMessage);
  }
}
