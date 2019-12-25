import '../../../../architecture/data/task/task.dart';
import '../../../model/profile.dart';
import '../../operations/implementation/profiles/get_remote_contacts_operation.dart';
import '../../repositories/self_profile_repository.dart';

class GetRemoteSelfContactsTask extends Task<void, List<Profile>> {

  final GetRemoteContactsOperation _getRemoteContactsOperation;
  final SelfProfileRepository _selfProfileRepository;

  GetRemoteSelfContactsTask(this._getRemoteContactsOperation, this._selfProfileRepository);

  @override
  Future<List<Profile>> createTaskFuture(void arg) async {
    final selfProfileId = _selfProfileRepository.data.id;
    return  _getRemoteContactsOperation.execute(selfProfileId);
  }
}
