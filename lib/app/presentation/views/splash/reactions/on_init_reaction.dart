import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../../connectivity_utils/architecture/data/func/is_network_available_func.dart';
import '../../../../data/repositories/profile_box.dart';
import '../../../../data/settings/log_in_info_setting.dart';
import '../../../../data/settings/profile_setting.dart';
import '../../../../data/tasks/profiles/get_profile_task.dart';
import '../../../../models/input_status.dart';
import '../../phone_input/phone_input_route.dart';
import '../../main/main_route.dart';
import '../splash_model.dart';
import 'funcs/get_profile_func.dart';

class OnInitReaction extends Reaction<void> {

  final ProfileBox _profileRepository;
  final ProfileSetting _profileSetting;
  final LogInInfoSetting _logInInfoSetting;
  final IsNetworkAvailableFunc _isNetworkAvailableFunc;
  final GetProfileTask _getProfileTask;
  final MainRoute _mainRoute;
  final PhoneInputRoute _phoneInputRoute;
  final GetProfileFunc _getProfileFunc;
  final SplashModel _model;

  OnInitReaction(
      this._profileRepository,
      this._profileSetting,
      this._logInInfoSetting,
      this._isNetworkAvailableFunc,
      this._getProfileTask,
      this._mainRoute,
      this._phoneInputRoute,
      this._getProfileFunc,
      this._model
  );

  @override
  void excite(void arg) async {
    final cachedSelfProfile = await _profileSetting.get();
    if (cachedSelfProfile != null) {
      _profileRepository.data = cachedSelfProfile;
      _getProfileTask.execute(null);
      await _model.refreshFuture;
      _mainRoute.replace(null);
      return;
    }

    final cachedUid = await _logInInfoSetting.get();
    if (cachedUid == null) {
      await _model.refreshFuture;
      _phoneInputRoute.replace(null);
      return;
    }

    final isNetworkAvailable = await _isNetworkAvailableFunc.call(null);
    if (!isNetworkAvailable) {
      _model.status = InputStatus.error;
      _model.refresh();
      return;
    }

    _model.status = InputStatus.loading;
    _model.refresh();
    _getProfileFunc.call(null);
  }
}
