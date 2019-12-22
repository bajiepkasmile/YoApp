import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../architecture/data/setting/setting.dart';

abstract class ShPrefSetting<TData> extends Setting<TData> {

  @protected
  final Future<SharedPreferences> _prefsFuture;

  @protected
  String get key;

  ShPrefSetting(this._prefsFuture);

  @override
  Future<void> setInternal(TData data) async {
    final prefs = await _prefsFuture;
    await setPref(prefs, data);
  }

  @override
  Future<TData> getInternal() async {
    final prefs = await _prefsFuture;
    return getPref(prefs);
  }

  @override
  Future<void> resetInternal() async {
    final prefs = await _prefsFuture;
    prefs.remove(key);
  }

  @protected
  Future<void> setPref(SharedPreferences prefs, TData data);

  @protected
  TData getPref(SharedPreferences prefs);
}
