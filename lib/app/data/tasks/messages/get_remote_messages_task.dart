import '../../../../architecture/data/task/task.dart';
import '../../../model/message.dart';
import '../../operations/implementation/messages/get_remote_messages_operation.dart';
import '../../repositories/self_profile_repository.dart';

class GetRemoteMessagesTask extends Task<String, List<Message>> {
  
  final GetRemoteMessagesOperation _getRemoteMessagesOperation;
  final SelfProfileRepository _selfProfileRepository;

  GetRemoteMessagesTask(this._getRemoteMessagesOperation, this._selfProfileRepository);

  @override
  Future<List<Message>> createTaskFuture(String contactId) {
    final selfId = _selfProfileRepository.data.id;
    final arg = GetRemoteMessagesOperationArg(selfId, contactId);
    return _getRemoteMessagesOperation.execute(arg);
  }
}
