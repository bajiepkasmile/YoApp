import 'package:architecture/common/async_func.dart';
import 'package:yo_app/data/funcs/remote/auth/log_in_func.dart';
import 'package:yo_app/data/tasks/auth/log_in_task.dart';
import 'package:yo_app/data/tasks/profiles/get_profile_task.dart';
import 'package:yo_app/presentation/views/main/main_route.dart';
import 'package:yo_app/presentation/views/profile_creator/profile_creator_route.dart';

class LogInFunc extends AsyncFunc<LogInFuncArg, void> {

  final LogInTask _logInTask;
  final GetProfileTask _getProfileTask;
  final MainRoute _mainRoute;
  final ProfileCreatorRoute _profileCreatorRoute;

  LogInFunc(this._logInTask, this._getProfileTask, this._mainRoute, this._profileCreatorRoute);

  @override
  Future<void> call(LogInFuncArg arg) async {
    await _logInTask.execute(arg);
    final selfProfile = await _getProfileTask.execute(null);
    if (selfProfile != null) {
      _mainRoute.replace(null);
    } else {
      _profileCreatorRoute.replace(null);
    }
  }
}
