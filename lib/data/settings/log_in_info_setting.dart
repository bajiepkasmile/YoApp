import 'package:architecture/data/setting/setting.dart';
import 'package:dart_utils/iterable_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yo_app/models/log_in_info.dart';

class LogInInfoSetting extends Setting<LogInInfo> {

  static const _UID_KEY = "id";
  static const _PHONE_KEY = "phone";

  final Future<SharedPreferences> _prefsFuture;

  LogInInfoSetting(this._prefsFuture);

  @override
  Future<LogInInfo> get() async {
    final prefs = await _prefsFuture;

    final uid = prefs.getString(_UID_KEY);
    final phone = prefs.getString(_PHONE_KEY);
    Iterable a;
    a.everyNull();

    if ([uid, phone].everyNull()) {
      return null;
    } else {
      return LogInInfo(uid, phone);
    }
  }

  @override
  Future<void> set(LogInInfo logInInfo) async {
    final prefs = await _prefsFuture;

    await prefs.setString(_UID_KEY, logInInfo.uid);
    await prefs.setString(_PHONE_KEY, logInInfo.phone);
  }

  @override
  Future<void> clear() async {
    final prefs = await _prefsFuture;

    await prefs.remove(_UID_KEY);
    await prefs.remove(_PHONE_KEY);
  }
}
