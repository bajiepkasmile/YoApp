import 'package:shared_preferences/shared_preferences.dart';

import 'base/sh_pref_setting.dart';

abstract class IntSetting extends ShPrefSetting<int> {

  IntSetting(SharedPreferences prefs) : super(prefs);

  @override
  Future<void> setInternal(int data) => prefs.setInt(key, data);

  @override
  int getInternal() => prefs.getInt(key);
}
