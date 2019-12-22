import '../../../architecture/data/task/task.dart';
import '../operations/implementation/auth/log_out_operation.dart';
import '../settings/self_profile_setting.dart';
import '../settings/uid_setting.dart';

class LogOutTask extends Task<void, void> {

  final LogOutOperation _logOutOperation;
  final SelfProfileSetting _selfProfileSetting;
  final UidSetting _uidSetting;

  LogOutTask(this._logOutOperation, this._selfProfileSetting, this._uidSetting);

  @override
  Future<void> createTaskFuture(void arg) async {
    await _logOutOperation.execute(null);
    await _selfProfileSetting.reset();
    await _uidSetting.reset();
  }
}
