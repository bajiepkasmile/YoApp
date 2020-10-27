import 'package:architecture/common/async_func.dart';
import 'package:yo_app/data/funcs/local/achievements/get_local_achievement_with_profile_ids_func.dart';
import 'package:yo_app/data/funcs/local/chats/get_local_chat_with_profile_ids_func.dart';
import 'package:yo_app/data/funcs/local/contacts/get_local_contact_general_infos_func.dart';
import 'package:yo_app/data/funcs/local/profile/get_local_avatar_func.dart';
import 'package:yo_app/data/settings/profile_general_info_setting.dart';
import 'package:yo_app/models/achievement.dart';
import 'package:yo_app/models/achievement_with_profile_id.dart';
import 'package:yo_app/models/chat.dart';
import 'package:yo_app/models/chat_with_profile_id.dart';
import 'package:yo_app/models/contact.dart';
import 'package:yo_app/models/contact_general_info.dart';
import 'package:yo_app/models/profile.dart';

class GetLocalProfileFunc extends AsyncFunc<void, Profile> {

  final ProfileGeneralInfoSetting _profileGeneralInfoSetting;
  final GetLocalAvatarFunc _getLocalAvatarFunc;
  final GetLocalContactGeneralInfosFunc _getLocalContactGeneralInfosFunc;
  final GetLocalChatWithProfileIdsFunc _getLocalChatWithProfileIdsFunc;
  final GetLocalAchievementWithProfileIdsFunc _getLocalAchievementWithProfileIdsFunc;

  GetLocalProfileFunc(
      this._profileGeneralInfoSetting,
      this._getLocalAvatarFunc,
      this._getLocalContactGeneralInfosFunc,
      this._getLocalChatWithProfileIdsFunc,
      this._getLocalAchievementWithProfileIdsFunc
  );

  @override
  Future<Profile> call(void arg) async {
    final profileGeneralInfo = await _profileGeneralInfoSetting.get();
    final avatar = await _getLocalAvatarFunc.call(profileGeneralInfo.avatarName);
    final contactGeneralInfos = await _getLocalContactGeneralInfosFunc.call(null);
    final chatWithProfileIds = await _getLocalChatWithProfileIdsFunc.call(null);
    final achievementWithProfileIds = await _getLocalAchievementWithProfileIdsFunc.call(null);

    return Profile(
        profileGeneralInfo.id,
        profileGeneralInfo.phone,
        avatar,
        profileGeneralInfo.name,
        profileGeneralInfo.likesCount,
        _getAchievementsByProfileId(achievementWithProfileIds, profileGeneralInfo.id),
        await _getContacts(contactGeneralInfos, chatWithProfileIds, achievementWithProfileIds)
    );
  }

  Future<List<Contact>> _getContacts(
      List<ContactGeneralInfo> contactGeneralInfos,
      List<ChatWithProfileId> chatWithProfileIds,
      List<AchievementWithProfileId> achievementWithProfileIds
  ) =>
      Stream.fromIterable(contactGeneralInfos)
          .asyncMap((contactGeneralInfo) async =>
              await _contactGeneralInfoToContact(
                  contactGeneralInfo,
                  chatWithProfileIds,
                  achievementWithProfileIds
              )
          )
        .toList();

  Future<Contact> _contactGeneralInfoToContact(
      ContactGeneralInfo contactGeneralInfo,
      List<ChatWithProfileId> chatsWithProfileIds,
      List<AchievementWithProfileId> achievementWithProfileIds
  ) async =>
      Contact(
          contactGeneralInfo.id,
          contactGeneralInfo.phone,
          await _getLocalAvatarFunc.call(contactGeneralInfo.avatarName),
          contactGeneralInfo.name,
          contactGeneralInfo.likesCount,
          _getAchievementsByProfileId(achievementWithProfileIds, contactGeneralInfo.id),
          _getChatByProfileId(chatsWithProfileIds, contactGeneralInfo.id),
          contactGeneralInfo.isInApp
      );

  Chat _getChatByProfileId(List<ChatWithProfileId> chatsWithProfileIds, String profileId) =>
      chatsWithProfileIds
          .firstWhere((chatWithProfileId) => chatWithProfileId.profileId == profileId)
          .chat;

  List<Achievement> _getAchievementsByProfileId(
      List<AchievementWithProfileId> achievementWithProfileIds,
      String profileId
  ) =>
      achievementWithProfileIds
          .where((achievementWithProfileId) => achievementWithProfileId.profileId == profileId)
          .map((achievementWithProfileId) => achievementWithProfileId.achievement)
          .toList();
}
