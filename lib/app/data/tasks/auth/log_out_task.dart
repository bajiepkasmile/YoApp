import '../../../../architecture/data/task/task.dart';
import '../../funcs/requests/auth/log_out_request.dart';
import '../../settings/profile_setting.dart';
import '../../settings/log_in_info_setting.dart';

class LogOutTask extends Task<void, void> {

  final LogOutRequest _logOutRequest;
  final ProfileSetting _profileSetting;
  final LogInInfoSetting _logInInfoSetting;

  LogOutTask(this._logOutRequest, this._profileSetting, this._logInInfoSetting);

  @override
  Future<void> createTaskFuture(void arg) async {
    await _logOutRequest.call(null);
    await _profileSetting.reset();
    await _logInInfoSetting.reset();
  }
}
