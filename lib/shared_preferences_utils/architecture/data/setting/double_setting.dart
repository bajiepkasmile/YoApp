import 'package:shared_preferences/shared_preferences.dart';

import 'base/sh_pref_setting.dart';

abstract class DoubleSetting extends ShPrefSetting<double> {

  DoubleSetting(Future<SharedPreferences> prefsFuture) : super(prefsFuture);

  @override
  Future<void> setPref(SharedPreferences prefs, double data) => prefs.setDouble(key, data);

  @override
  double getPref(SharedPreferences prefs) => prefs.getDouble(key);
}
