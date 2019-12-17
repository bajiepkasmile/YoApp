import 'package:shared_preferences/shared_preferences.dart';

import 'base/sh_pref_setting.dart';

abstract class StringSetting extends ShPrefSetting<String> {

  StringSetting(SharedPreferences prefs) : super(prefs);

  @override
  Future<void> setInternal(String data) => prefs.setString(key, data);

  @override
  String getInternal() => prefs.getString(key);
}
