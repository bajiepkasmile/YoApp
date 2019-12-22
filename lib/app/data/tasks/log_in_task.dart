import '../../../architecture/data/task/task.dart';
import '../operations/implementation/auth/log_in_operation.dart';
import '../settings/uid_setting.dart';

class LogInTask extends Task<LogInArg, String> {

  final LogInOperation _logInOperation;
  final UidSetting _uidSetting;

  LogInTask(this._logInOperation, this._uidSetting);

  @override
  Future<String> createTaskFuture(LogInArg arg) async {
    final uid = await _logInOperation.execute(arg);
    await _uidSetting.set(uid);
    return uid;
  }
}
