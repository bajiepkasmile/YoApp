import '../../../../architecture/common/async_func.dart';
import '../../../data/funcs/requests/auth/log_in_request.dart';
import '../../../data/tasks/profiles/get_profile_task.dart';
import '../../../data/tasks/auth/log_in_task.dart';
import '../../views/main/main_route.dart';
import '../../views/profile_creator/profile_creator_route.dart';

class LogInFunc extends AsyncFunc<LogInRequestArg, void> {

  final LogInTask _logInTask;
  final GetProfileTask _getProfileTask;
  final MainRoute _mainRoute;
  final ProfileCreatorRoute _profileCreatorRoute;

  LogInFunc(this._logInTask, this._getProfileTask, this._mainRoute, this._profileCreatorRoute);

  @override
  Future<void> call(LogInRequestArg arg) async {
    await _logInTask.execute(arg);
    final selfProfile = await _getProfileTask.execute(null);
    if (selfProfile != null) {
      _mainRoute.replace(null);
    } else {
      _profileCreatorRoute.replace(null);
    }
  }
}
