import 'package:yo_app/app/data/settings/log_in_info_setting.dart';

import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../data/tasks/create_self_profile_task.dart';
import '../profile_creator_model.dart';

class OnNameSubmittedReaction extends Reaction<void> {

  final ProfileCreatorModel _model;
  final LogInInfoSetting _logInInfoSetting;
  final CreateSelfProfileTask _createSelfProfileTask;

  OnNameSubmittedReaction(this._model, this._logInInfoSetting, this._createSelfProfileTask);

  @override
  void excite(void arg) async {
    _model.isLoading = true;
    _model.refresh();

    final logInInfo = await _logInInfoSetting.get();
    final arg = CreateSelfProfileArg(logInInfo.phone, _model.name);
    await _createSelfProfileTask.execute(arg);
    //TODO: follow replacement ContactListRoute
  }
}
