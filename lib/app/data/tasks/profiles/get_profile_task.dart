import '../../../../architecture/data/task/task.dart';
import '../../../models/profile.dart';
import '../../funcs/requests/profile/get_profile_request.dart';
import '../../repositories/profile_box.dart';
import '../../settings/profile_setting.dart';
import '../../settings/log_in_info_setting.dart';

class GetProfileTask extends Task<void, Profile> {

  final GetProfileRequest _getProfileRequest;
  final LogInInfoSetting _logInInfoSetting;
  final ProfileSetting _profileSetting;
  final ProfileBox _profileRepository;

  GetProfileTask(
      this._getProfileRequest,
      this._logInInfoSetting,
      this._profileSetting,
      this._profileRepository
  );

  @override
  Future<Profile> createTaskFuture(void arg) async{
    final logInInfo = await _logInInfoSetting.get();
    if (logInInfo == null) {
      return null;
    }

    final profile = await _getProfileRequest.call(logInInfo.uid);
    if (profile == null) {
      return null;
    }

    await _profileSetting.set(profile);
    _profileRepository.data = profile;
    return profile;
  }
}

/*
//    final selfProfileId = _profileRepository.data.id;
//    return  _getContactsRequest.call(selfProfileId);

final selfId = _profileRepository.data.id;
    final arg = GetMessagesRequestArg(selfId, contactId);
    return _getMessagesRequest.call(arg);
 */

