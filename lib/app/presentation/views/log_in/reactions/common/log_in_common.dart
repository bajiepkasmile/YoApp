import '../../../../../../architecture/common/async_common.dart';
import '../../../../../data/operations/implementation/auth/log_in_operation.dart';
import '../../../../../data/tasks/get_remote_self_profile_task.dart';
import '../../../../../data/tasks/log_in_task.dart';

class LogInCommon extends AsyncCommon<LogInArg, void> {

  final LogInTask _logInTask;
  final GetRemoteSelfProfileTask _getRemoteSelfProfileTask;

  LogInCommon(this._logInTask, this._getRemoteSelfProfileTask);

  @override
  Future<void> call(LogInArg arg) async {
    await _logInTask.execute(arg);
    await _getRemoteSelfProfileTask.execute(null);
    //TODO: ContactListRoute
  }
}
