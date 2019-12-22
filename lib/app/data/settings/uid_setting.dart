import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared_preferences_utils/architecture/data/setting/string_setting.dart';

class UidSetting extends StringSetting {

  UidSetting(Future<SharedPreferences> prefsFuture) : super(prefsFuture);

  @override
  String get key => "uid";
}
