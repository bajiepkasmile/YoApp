import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:connectivity_utils/architecture/data/func/is_network_available_func.dart';
import 'package:yo_app/data/tasks/profiles/create_profile_task.dart';
import 'package:yo_app/models/input_status.dart';
import 'package:yo_app/presentation/views/main/main_route.dart';
import 'package:yo_app/presentation/views/profile_creator/profile_creator_model.dart';

class OnCreateProfileReaction extends Reaction<void> {

  final IsNetworkAvailableFunc _isNetworkAvailableFunc;
  final CreateProfileTask _createProfileTask;
  final MainRoute _mainRoute;
  final ProfileCreatorModel _model;

  OnCreateProfileReaction(this._isNetworkAvailableFunc, this._createProfileTask, this._mainRoute, this._model);

  @override
  void excite(void arg) async {
    final isNetworkAvailable = await _isNetworkAvailableFunc.call(null);
    if (!isNetworkAvailable) {
      _refreshWithError();
      return null;
    }

    _model.status = InputStatus.loading;
    _model.refresh();

    try {
      final arg = CreateProfileTaskArg(_model.avatarFile, _model.name);
      await _createProfileTask.execute(arg);
      _mainRoute.replace(null);
    } catch (e) {
      _refreshWithError();
    }
  }

  void _refreshWithError() {
    _model.status = InputStatus.error;
    _model.refresh();
  }
}
