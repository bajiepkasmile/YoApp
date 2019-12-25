import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../data/tasks/messages/get_remote_messages_task.dart';
import '../chat_model.dart';

class OnInitReaction extends Reaction<void> {

  final ChatModel _chatModel;
  final GetRemoteMessagesTask _getRemoteMessagesTask;

  OnInitReaction(this._chatModel, this._getRemoteMessagesTask);

  @override
  void excite(void arg) async {
    _chatModel.messages = await _getRemoteMessagesTask.execute(_chatModel.arg.id);
    _chatModel.refresh();
  }
}
