import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../model/message.dart';
import '../chat_model.dart';

class OnReceiveMessageReaction extends Reaction<Message> {

  final ChatModel _chatModel;

  OnReceiveMessageReaction(this._chatModel);

  @override
  void excite(Message message) {
    _chatModel.messages.add(message);
    _chatModel.refresh();
  }
}
