import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../data/operations/implementation/messages/send_message_operation.dart';
import '../../../../model/message.dart';
import '../../../../model/message_status.dart';
import '../../../../model/profile.dart';
import '../chat_model.dart';

class OnSendMessageReaction extends Reaction<void> {

  final Profile _contact;
  final ChatModel _chatModel;
  final SendMessageOperation _sendMessageOperation;

  OnSendMessageReaction(this._contact, this._chatModel, this._sendMessageOperation);

  @override
  void excite(void arg) async {
    final message = _createMessage();
    _chatModel.messages.insert(0, message);
    _chatModel.refresh();

    final sentMessage = await _sendMessage(message);
    _updateMessage(sentMessage);
    _chatModel.refresh();
  }

  Message _createMessage() => Message(
      "",
      _contact.id,
      MessageStatus.sending,
      "Yo",
      true,
      DateTime.now().millisecondsSinceEpoch
  );

  Future<Message> _sendMessage(Message message) => _sendMessageOperation.execute(SendMessageArg(_contact, message));

  void _updateMessage(Message updatingMessage) {
    final messages = _chatModel.messages;
    final messageIndex = messages.indexWhere((message) => message.localTimestamp == updatingMessage.localTimestamp);
    messages.removeAt(messageIndex);
    messages.insert(messageIndex, updatingMessage);
  }
}
