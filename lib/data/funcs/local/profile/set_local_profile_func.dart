import 'package:architecture/common/async_func.dart';
import 'package:yo_app/data/funcs/local/achievements/set_local_achievement_with_profile_ids_func.dart';
import 'package:yo_app/data/funcs/local/chats/set_local_chat_with_profile_ids_func.dart';
import 'package:yo_app/data/funcs/local/contacts/set_local_contact_general_infos_func.dart';
import 'package:yo_app/data/funcs/local/profile/set_local_avatar_func.dart';
import 'package:yo_app/data/settings/profile_general_info_setting.dart';
import 'package:yo_app/models/achievement_with_profile_id.dart';
import 'package:yo_app/models/chat_with_profile_id.dart';
import 'package:yo_app/models/contact.dart';
import 'package:yo_app/models/contact_general_info.dart';
import 'package:yo_app/models/profile.dart';
import 'package:yo_app/models/profile_general_info.dart';

class SetLocalProfileFunc extends AsyncFunc<Profile, void> {

  final ProfileGeneralInfoSetting _profileGeneralInfoSetting;
  final SetLocalAvatarFunc _setLocalAvatarFunc;
  final SetLocalContactGeneralInfosFunc _setLocalContactGeneralInfosFunc;
  final SetLocalChatWithProfileIdsFunc _setLocalChatWithProfileIdsFunc;
  final SetLocalAchievementWithProfileIdsFunc _setLocalAchievementWithProfileIdsFunc;

  SetLocalProfileFunc(
      this._profileGeneralInfoSetting,
      this._setLocalAvatarFunc,
      this._setLocalContactGeneralInfosFunc,
      this._setLocalChatWithProfileIdsFunc,
      this._setLocalAchievementWithProfileIdsFunc
  );

  @override
  Future<void> call(Profile profile) async {
    final profileGeneralInfo = ProfileGeneralInfo(
        profile.id,
        profile.phone,
        profile.avatar.name,
        profile.name,
        profile.likesCount
    );
    final contactGeneralInfos = _contactToContactGeneralInfos(profile.contacts);
    final chatWithProfileIds = _contactsToChatWithProfileIds(profile.contacts);
    final achievementWithProfileIds =
        _contactsToAchievementWithProfileIds(profile.contacts)
            ..addAll(_profileToAchievementWithProfileIds(profile));
    await _profileGeneralInfoSetting.set(profileGeneralInfo);
    await _setLocalAvatarFunc.call(profile.avatar);
    await _setLocalContactGeneralInfosFunc.call(contactGeneralInfos);
    await _setLocalChatWithProfileIdsFunc.call(chatWithProfileIds);
    await _setLocalAchievementWithProfileIdsFunc.call(achievementWithProfileIds);
  }

  List<ContactGeneralInfo> _contactToContactGeneralInfos(List<Contact> contacts) =>
      contacts
          .map((contact) => ContactGeneralInfo(
          contact.id,
          contact.phone,
          contact.avatar.name,
          contact.name, contact.likesCount, contact.isInApp
      ))
      .toList();

  List<ChatWithProfileId> _contactsToChatWithProfileIds(List<Contact> contacts) =>
      contacts
          .map((contact) => ChatWithProfileId(contact.chat, contact.id))
          .toList();

  List<AchievementWithProfileId> _contactsToAchievementWithProfileIds(List<Contact> contacts) =>
      contacts
          .map((contact) => _profileToAchievementWithProfileIds(contact))
          .expand((achievementWithProfileIds) => achievementWithProfileIds)
          .toList();

  List<AchievementWithProfileId> _profileToAchievementWithProfileIds(Profile profile) =>
      profile.achievements.map((achievement) => AchievementWithProfileId(achievement, profile.id));
}
