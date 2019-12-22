import 'package:shared_preferences/shared_preferences.dart';

import 'base/sh_pref_setting.dart';

abstract class BoolSetting extends ShPrefSetting<bool> {

  BoolSetting(Future<SharedPreferences> prefsFuture) : super(prefsFuture);

  @override
  Future<void> setPref(SharedPreferences prefs, bool data) => prefs.setBool(key, data);

  @override
  bool getPref(SharedPreferences prefs) => prefs.getBool(key);
}
