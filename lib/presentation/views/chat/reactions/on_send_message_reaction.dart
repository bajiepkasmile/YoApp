
//class OnSendMessageReaction extends Reaction<void> {
//
//  final ChatModel _chatModel;
//  final SendMessageTask _sendMessageTask;
//
//  OnSendMessageReaction(this._chatModel, this._sendMessageTask);
//
//  @override
//  void excite(void arg) async {
//    final sendingMessage = Message(null, null, _chatModel.arg.id, MessageStatus.sending, null, 0, true);
//    _chatModel.messages.insert(0, sendingMessage);
//    _chatModel.refresh();
//
//    final sentMessage = await _sendMessageTask.execute(_chatModel.arg.id);
//    _replaceMessage(sendingMessage, sentMessage);
//    _chatModel.refresh();
//  }
//
//  void _replaceMessage(Message replacingMessage, Message newMessage) {
//    final messages = _chatModel.messages;
//    final messageIndex = messages.indexOf(replacingMessage);
//    messages.removeAt(messageIndex);
//    messages.insert(messageIndex, newMessage);
//  }
//}
