import '../../../../architecture/data/task/task.dart';
import '../../../model/message.dart';
import '../../operations/implementation/messages/send_message_operation.dart';
import '../../repositories/self_profile_repository.dart';

class SendMessageTask extends Task<String, Message> {

  final SendMessageOperation _sendMessageOperation;
  final SelfProfileRepository _selfProfileRepository;

  SendMessageTask(this._sendMessageOperation, this._selfProfileRepository);

  @override
  Future<Message> createTaskFuture(String contactId) {
    final selfProfileId = _selfProfileRepository.data.id;
    final arg = SendMessageOperationArg(selfProfileId, contactId);
    return _sendMessageOperation.execute(arg);
  }
}
