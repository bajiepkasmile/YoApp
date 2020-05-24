import '../../../../architecture/data/task/task.dart';
import '../../../models/log_in_info.dart';
import '../../funcs/requests/auth/log_in_request.dart';
import '../../settings/log_in_info_setting.dart';

class LogInTask extends Task<LogInRequestArg, LogInInfo> {

  final LogInRequest _logInRequest;
  final LogInInfoSetting _logInInfoSetting;

  LogInTask(this._logInRequest, this._logInInfoSetting);

  @override
  Future<LogInInfo> createTaskFuture(LogInRequestArg arg) async {
    final logInInfo = await _logInRequest.call(arg);
    await _logInInfoSetting.set(logInInfo);
    return logInInfo;
  }
}
