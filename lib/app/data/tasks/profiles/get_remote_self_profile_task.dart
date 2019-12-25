import '../../../../architecture/data/task/task.dart';
import '../../../model/profile.dart';
import '../../operations/implementation/profiles/get_remote_profile_operation.dart';
import '../../repositories/self_profile_repository.dart';
import '../../settings/self_profile_setting.dart';
import '../../settings/log_in_info_setting.dart';

class GetRemoteSelfProfileTask extends Task<void, Profile> {

  final GetRemoteProfileOperation _getRemoteProfileOperation;
  final LogInInfoSetting _logInInfoSetting;
  final SelfProfileSetting _selfProfileSetting;
  final SelfProfileRepository _selfProfileRepository;

  GetRemoteSelfProfileTask(
      this._getRemoteProfileOperation,
      this._logInInfoSetting,
      this._selfProfileSetting,
      this._selfProfileRepository
  );

  @override
  Future<Profile> createTaskFuture(void arg) async{
    final logInInfo = await _logInInfoSetting.get();
    final profile = await _getRemoteProfileOperation.execute(logInInfo.uid);

    if (profile == null) {
      return null;
    }

    await _selfProfileSetting.set(profile);
    _selfProfileRepository.data = profile;
    return profile;
  }
}
