import 'package:shared_preferences/shared_preferences.dart';

import '../../../architecture/data/setting/setting.dart';
import '../../../dart_utils/object_util.dart';
import '../../model/log_in_info.dart';

class LogInInfoSetting extends Setting<LogInInfo> {

  static const _UID_KEY = "id";
  static const _PHONE_KEY = "phone";

  final Future<SharedPreferences> _prefsFuture;

  LogInInfoSetting(this._prefsFuture);

  @override
  Future<LogInInfo> getInternal() async {
    final prefs = await _prefsFuture;
    final uid = prefs.getString(_UID_KEY);
    final phone = prefs.getString(_PHONE_KEY);

    if (ObjectUtil.isAllNull([uid, phone])) {
      return null;
    }

    return LogInInfo(uid, phone);
  }

  @override
  Future<void> setInternal(LogInInfo logInInfo) async {
    final prefs = await _prefsFuture;
    await prefs.setString(_UID_KEY, logInInfo.uid);
    await prefs.setString(_PHONE_KEY, logInInfo.phone);
  }

  @override
  Future<void> resetInternal() async {
    final prefs = await _prefsFuture;
    await prefs.remove(_UID_KEY);
    await prefs.remove(_PHONE_KEY);
  }
}
