import 'package:shared_preferences/shared_preferences.dart';

import 'base/sh_pref_setting.dart';

abstract class IntSetting extends ShPrefSetting<int> {

  IntSetting(Future<SharedPreferences> prefsFuture) : super(prefsFuture);

  @override
  Future<void> setPref(SharedPreferences prefs, int data) => prefs.setInt(key, data);

  @override
  int getPref(SharedPreferences prefs) => prefs.getInt(key);
}
