import 'package:shared_preferences/shared_preferences.dart';

import 'base/sh_pref_setting.dart';

abstract class DoubleSetting extends ShPrefSetting<double> {

  DoubleSetting(SharedPreferences prefs) : super(prefs);

  @override
  Future<void> setInternal(double data) => prefs.setDouble(key, data);

  @override
  double getInternal() => prefs.getDouble(key);
}
