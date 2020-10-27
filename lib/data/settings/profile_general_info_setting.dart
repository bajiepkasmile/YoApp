import 'package:architecture/data/setting/setting.dart';
import 'package:dart_utils/iterable_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yo_app/models/profile_general_info.dart';

class ProfileGeneralInfoSetting extends Setting<ProfileGeneralInfo> {

  static const _ID_KEY = "id";
  static const _PHONE_KEY = "phone";
  static const _AVATAR_NAME_KEY = "avatar_file_name";
  static const _NAME_KEY = "full_name";
  static const _LIKES_COUNT_KEY = "likes_count";

  final Future<SharedPreferences> _prefsFuture;

  ProfileGeneralInfoSetting(this._prefsFuture);

  @override
  Future<ProfileGeneralInfo> get() async {
    final prefs = await _prefsFuture;

    final id = prefs.getString(_ID_KEY);
    final phone = prefs.getString(_PHONE_KEY);
    final avatarName = prefs.getString(_AVATAR_NAME_KEY);
    final name = prefs.getString(_NAME_KEY);
    final likesCount = prefs.getInt(_LIKES_COUNT_KEY);

    if ([id, phone, avatarName, name, likesCount].everyNull()) {
      return null;
    } else {
      return ProfileGeneralInfo(id, phone, avatarName, name, likesCount);
    }
  }

  @override
  Future<void> set(ProfileGeneralInfo profileGeneralInfo) async {
    final prefs = await _prefsFuture;

    await prefs.setString(_ID_KEY, profileGeneralInfo.id);
    await prefs.setString(_PHONE_KEY, profileGeneralInfo.phone);
    await prefs.setString(_AVATAR_NAME_KEY, profileGeneralInfo.avatarName);
    await prefs.setString(_NAME_KEY, profileGeneralInfo.name);
    await prefs.setInt(_LIKES_COUNT_KEY, profileGeneralInfo.likesCount);
  }

  @override
  Future<void> clear() async {
    final prefs = await _prefsFuture;
    await prefs.remove(_ID_KEY);
    await prefs.remove(_PHONE_KEY);
    await prefs.remove(_AVATAR_NAME_KEY);
    await prefs.remove(_NAME_KEY);
    await prefs.remove(_LIKES_COUNT_KEY);
  }
}
