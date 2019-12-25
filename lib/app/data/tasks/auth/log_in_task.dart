import '../../../../architecture/data/task/task.dart';
import '../../../model/log_in_info.dart';
import '../../operations/implementation/auth/log_in_operation.dart';
import '../../settings/log_in_info_setting.dart';

class LogInTask extends Task<LogInOperationArg, LogInInfo> {

  final LogInOperation _logInOperation;
  final LogInInfoSetting _logInInfoSetting;

  LogInTask(this._logInOperation, this._logInInfoSetting);

  @override
  Future<LogInInfo> createTaskFuture(LogInOperationArg arg) async {
    final logInInfo = await _logInOperation.execute(arg);
    await _logInInfoSetting.set(logInInfo);
    return logInInfo;
  }
}
