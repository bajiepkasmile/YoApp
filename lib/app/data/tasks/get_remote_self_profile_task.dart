import '../../../architecture/data/task/task.dart';
import '../../model/profile.dart';
import '../operations/implementation/profiles/get_remote_self_profile_operation.dart';
import '../repositories/self_profile_repository.dart';
import '../settings/self_profile_setting.dart';

class GetRemoteSelfProfileTask extends Task<void, Profile> {

  final GetRemoteSelfProfileOperation _getRemoteSelfProfileOperation;
  final SelfProfileSetting _selfProfileSetting;
  final SelfProfileRepository _selfProfileRepository;

  GetRemoteSelfProfileTask(this._getRemoteSelfProfileOperation, this._selfProfileSetting, this._selfProfileRepository);

  @override
  Future<Profile> createTaskFuture(void arg) async{
    final profile = await _getRemoteSelfProfileOperation.execute(null);
    await _selfProfileSetting.set(profile);
    _selfProfileRepository.data = profile;
    return profile;
  }
}
