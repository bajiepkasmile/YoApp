import 'package:architecture/common/async_func.dart';
import 'package:yo_app/data/tasks/profiles/get_profile_task.dart';
import 'package:yo_app/models/input_status.dart';
import 'package:yo_app/presentation/views/main/main_route.dart';
import 'package:yo_app/presentation/views/profile_creator/profile_creator_route.dart';
import 'package:yo_app/presentation/views/splash/splash_model.dart';

class GetProfileFunc extends AsyncFunc<void, void> {

  final GetProfileTask _getProfileTask;
  final MainRoute _mainRoute;
  final ProfileCreatorRoute _profileCreatorRoute;
  final SplashModel _model;

  GetProfileFunc(this._getProfileTask, this._mainRoute, this._profileCreatorRoute, this._model);

  @override
  Future<void> call(void arg) async {
    _model.status = InputStatus.loading;
    _model.refresh();
    try {
      final profile = await _getProfileTask.execute(null);
      await _model.refreshFuture;
      if (profile != null) {
        _mainRoute.replace(null);
      } else {
        _profileCreatorRoute.replace(null);
      }
    } catch (e) {
      _model.status = InputStatus.error;
      _model.refresh();
    }
  }
}
