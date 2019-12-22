import 'package:shared_preferences/shared_preferences.dart';

import 'base/sh_pref_setting.dart';

abstract class StringSetting extends ShPrefSetting<String> {

  StringSetting(Future<SharedPreferences> prefsFuture) : super(prefsFuture);

  @override
  Future<void> setPref(SharedPreferences prefs, String data) => prefs.setString(key, data);

  @override
  String getPref(SharedPreferences prefs) => prefs.getString(key);
}
