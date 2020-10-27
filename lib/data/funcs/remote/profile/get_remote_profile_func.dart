import 'package:architecture/common/async_func.dart';
import 'package:yo_app/data/funcs/remote/achievements/get_remote_achievements_func.dart';
import 'package:yo_app/data/funcs/remote/contacts/get_remote_contacts_func.dart';
import 'package:yo_app/data/funcs/remote/profile/get_remote_avatar_func.dart';
import 'package:yo_app/data/funcs/remote/profile/get_remote_profile_general_info_func.dart';
import 'package:yo_app/models/profile.dart';

class GetRemoteProfileFunc extends AsyncFunc<void, Profile> {

  final GetRemoteProfileGeneralInfoFunc _getRemoteProfileGeneralInfoFunc;
  final GetRemoteAvatarFunc _getRemoteAvatarFunc;
  final GetRemoteAchievementsFunc _getRemoteAchievementsFunc;
  final GetRemoteContactsFunc _getRemoteContactsFunc;

  GetRemoteProfileFunc(
      this._getRemoteProfileGeneralInfoFunc,
      this._getRemoteAvatarFunc,
      this._getRemoteAchievementsFunc,
      this._getRemoteContactsFunc,
  );

  @override
  Future<Profile> call(void arg) async {
    final profileGeneralInfo = await _getRemoteProfileGeneralInfoFunc.call(null);
    final avatar = profileGeneralInfo.avatarName != null
        ? await _getRemoteAvatarFunc.call(profileGeneralInfo.avatarName)
        : null;
    final achievements = await _getRemoteAchievementsFunc.call(null);
    final contacts = await _getRemoteContactsFunc.call(profileGeneralInfo.id);

    return Profile(
        profileGeneralInfo.id,
        profileGeneralInfo.phone,
        avatar,
        profileGeneralInfo.phone,
        profileGeneralInfo.likesCount,
        achievements,
        contacts
    );
  }
}
