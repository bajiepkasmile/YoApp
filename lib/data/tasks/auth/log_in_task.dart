import 'package:architecture/data/task/task.dart';
import 'package:yo_app/data/boxes/log_in_info_box.dart';
import 'package:yo_app/data/funcs/remote/auth/log_in_func.dart';
import 'package:yo_app/data/settings/log_in_info_setting.dart';
import 'package:yo_app/models/log_in_info.dart';

class LogInTask extends Task<LogInFuncArg, LogInInfo> {

  final LogInFunc _logInFunc;
  final LogInInfoSetting _logInInfoSetting;
  final LogInInfoBox _logInInfoBox;

  LogInTask(this._logInFunc, this._logInInfoSetting, this._logInInfoBox);

  @override
  Future<LogInInfo> createTaskFuture(LogInFuncArg arg) async {
    final logInInfo = await _logInFunc.call(arg);
    await _logInInfoSetting.set(logInInfo);
    _logInInfoBox.data = logInInfo;
    return logInInfo;
  }
}
