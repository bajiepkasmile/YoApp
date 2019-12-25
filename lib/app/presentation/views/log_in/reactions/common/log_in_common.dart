import '../../../../../../architecture/common/async_common.dart';
import '../../../../../data/operations/implementation/auth/log_in_operation.dart';
import '../../../../../data/tasks/profiles/get_remote_self_profile_task.dart';
import '../../../../../data/tasks/auth/log_in_task.dart';
import '../../../profile_creator/profile_creator_route.dart';

class LogInCommon extends AsyncCommon<LogInOperationArg, void> {

  final LogInTask _logInTask;
  final GetRemoteSelfProfileTask _getRemoteSelfProfileTask;
  final ProfileCreatorRoute _profileCreatorRoute;

  LogInCommon(this._logInTask, this._getRemoteSelfProfileTask, this._profileCreatorRoute);

  @override
  Future<void> call(LogInOperationArg arg) async {
    await _logInTask.execute(arg);
    final selfProfile = await _getRemoteSelfProfileTask.execute(null);
    if (selfProfile != null) {
      //TODO: follow replacement ContactListRoute
    } else {
      _profileCreatorRoute.followReplacement(null);
    }
  }
}
