import 'package:shared_preferences/shared_preferences.dart';

import 'base/sh_pref_setting.dart';

abstract class BoolSetting extends ShPrefSetting<bool> {

  BoolSetting(SharedPreferences prefs) : super(prefs);

  @override
  Future<void> setInternal(bool data) => prefs.setBool(key, data);

  @override
  bool getInternal() => prefs.getBool(key);
}
