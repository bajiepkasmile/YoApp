import 'package:architecture/data/task/task.dart';
import 'package:yo_app/data/funcs/remote/auth/log_out_func.dart';
import 'package:yo_app/data/settings/log_in_info_setting.dart';
import 'package:yo_app/data/settings/profile_general_info_setting.dart';

class LogOutTask extends Task<void, void> {

  final LogOutFunc _logOutFunc;
  final ProfileGeneralInfoSetting _profileSetting;
  final LogInInfoSetting _logInInfoSetting;

  LogOutTask(this._logOutFunc, this._profileSetting, this._logInInfoSetting);

  @override
  Future<void> createTaskFuture(void arg) async {
    await _logOutFunc.call(null);
    await _profileSetting.clear();
    await _logInInfoSetting.clear();
  }
}
