import '../../../../architecture/data/task/task.dart';
import '../../operations/implementation/auth/log_out_operation.dart';
import '../../settings/self_profile_setting.dart';
import '../../settings/log_in_info_setting.dart';

class LogOutTask extends Task<void, void> {

  final LogOutOperation _logOutOperation;
  final SelfProfileSetting _selfProfileSetting;
  final LogInInfoSetting _logInInfoSetting;

  LogOutTask(this._logOutOperation, this._selfProfileSetting, this._logInInfoSetting);

  @override
  Future<void> createTaskFuture(void arg) async {
    await _logOutOperation.execute(null);
    await _selfProfileSetting.reset();
    await _logInInfoSetting.reset();
  }
}
