import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../data/operations/implementation/messages/get_remote_messages_operation.dart';
import '../../../../model/profile.dart';
import '../chat_model.dart';

class OnInitReaction extends Reaction<void> {

  final Profile _contact;
  final ChatModel _chatModel;
  final GetRemoteMessagesOperation _getRemoteMessagesOperation;

  OnInitReaction(this._contact, this._chatModel, this._getRemoteMessagesOperation);

  @override
  void excite(void arg) async {
    _chatModel.messages = await _getRemoteMessagesOperation.execute(_contact.id);
    _chatModel.refresh();
  }
}
