import 'package:shared_preferences/shared_preferences.dart';

import '../../../dart_utils/iterable_extension.dart';
import '../../../architecture/data/setting/setting.dart';
import '../../models/profile.dart';

//TODO: profile store?
class ProfileSetting extends Setting<Profile> {

  static const _ID_KEY = "id";
  static const _PHONE_KEY = "phone";
  static const _NAME_KEY = "full_name";

  final Future<SharedPreferences> _prefsFuture;

  ProfileSetting(this._prefsFuture);

  @override
  Future<Profile> getInternal() async {
    final prefs = await _prefsFuture;
    final id = prefs.getString(_ID_KEY);
    final phone = prefs.getString(_PHONE_KEY);

//    final avatarUrl = prefs.getString(_AVATAR_URL_KEY);

    final name = prefs.getString(_NAME_KEY);
//    final likesCount = ;


//    if (ObjectUtil.everyNull([id, phone, avatarUrl, name])) {
//      return null;
//    }

    return Profile(id, phone, null, name, 0, [], []);
  }

  @override
  Future<void> setInternal(Profile profile) async {



    final prefs = await _prefsFuture;
    await prefs.setString(_ID_KEY, profile.id);
    await prefs.setString(_PHONE_KEY, profile.phone);
//    await prefs.setString(_AVATAR_URL_KEY, profile.avatarUrl);
    await prefs.setString(_NAME_KEY, profile.name);
  }

  @override
  Future<void> resetInternal() async {
    final prefs = await _prefsFuture;
    await prefs.remove(_ID_KEY);
    await prefs.remove(_PHONE_KEY);
//    await prefs.remove(_AVATAR_URL_KEY);
    await prefs.remove(_NAME_KEY);
  }
}
