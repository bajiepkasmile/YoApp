import 'package:architecture/common/async_func.dart';
import 'package:yo_app/data/funcs/remote/achievements/get_remote_achievements_func.dart';
import 'package:yo_app/data/funcs/remote/contacts/get_remote_contact_general_infos_func.dart';
import 'package:yo_app/data/funcs/remote/profile/get_remote_avatar_func.dart';
import 'package:yo_app/models/contact.dart';
import 'package:yo_app/models/contact_general_info.dart';

class GetRemoteContactsFunc extends AsyncFunc<String, List<Contact>> {

  final GetRemoteContactGeneralInfosFunc _getRemoteContactsGeneralInfoFunc;
  final GetRemoteAvatarFunc _getRemoteAvatarFunc;
  final GetRemoteAchievementsFunc _getRemoteAchievementsFunc;

  GetRemoteContactsFunc(
      this._getRemoteContactsGeneralInfoFunc,
      this._getRemoteAvatarFunc,
      this._getRemoteAchievementsFunc
  );

  @override
  Future<List<Contact>> call(String profileId) async {
    final contactGeneralInfos = await _getRemoteContactsGeneralInfoFunc.call(null);
    contactGeneralInfos.map(contactGeneralInfoToContact).toList();
  }

  Future<Contact> contactGeneralInfoToContact(ContactGeneralInfo contactGeneralInfo) async {
    final avatar = await _getRemoteAvatarFunc.call(contactGeneralInfo.avatarName); //TODO
    final achievements = await _getRemoteAchievementsFunc.call(null);
    return Contact(
        contactGeneralInfo.id,
        contactGeneralInfo.phone,
        avatar,
        contactGeneralInfo.name,
        contactGeneralInfo.likesCount,
        achievements,
        null,
        contactGeneralInfo.isInApp
    );
  }
}
