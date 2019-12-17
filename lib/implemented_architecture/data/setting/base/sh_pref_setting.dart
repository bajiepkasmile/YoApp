import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../architecture/data/setting/setting.dart';

abstract class ShPrefSetting<TData> extends Setting<TData> {

  @protected
  final SharedPreferences prefs;

  @protected
  String get key;

  ShPrefSetting(this.prefs);

  @override
  Future<void> reset() => prefs.remove(key);
}
