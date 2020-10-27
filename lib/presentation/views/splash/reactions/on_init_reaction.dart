import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:connectivity_utils/architecture/data/func/is_network_available_func.dart';
import 'package:yo_app/data/boxes/log_in_info_box.dart';
import 'package:yo_app/data/boxes/profile_box.dart';
import 'package:yo_app/data/settings/log_in_info_setting.dart';
import 'package:yo_app/data/settings/profile_general_info_setting.dart';
import 'package:yo_app/data/tasks/profiles/get_profile_task.dart';
import 'package:yo_app/models/input_status.dart';
import 'package:yo_app/presentation/views/main/main_route.dart';
import 'package:yo_app/presentation/views/phone_input/phone_input_route.dart';
import 'package:yo_app/presentation/views/splash/reactions/funcs/get_profile_func.dart';
import 'package:yo_app/presentation/views/splash/splash_model.dart';

class OnInitReaction extends Reaction<void> {

  final ProfileBox _profileBox;
  final LogInInfoBox _logInInfoBox;
  final ProfileGeneralInfoSetting _profileGeneralInfoSetting;
  final LogInInfoSetting _logInInfoSetting;
  final IsNetworkAvailableFunc _isNetworkAvailableFunc;
  final GetProfileTask _getProfileTask;
  final MainRoute _mainRoute;
  final PhoneInputRoute _phoneInputRoute;
  final GetProfileFunc _getProfileFunc;
  final SplashModel _model;

  OnInitReaction(
      this._profileBox,
      this._profileGeneralInfoSetting,
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
    final cachedSelfProfile = await _profileGeneralInfoSetting.get();
    if (cachedSelfProfile != null) {
      _profileBox.data = cachedSelfProfile;
      _getProfileTask.execute(null);
      await _model.refreshFuture;
      _mainRoute.replace(null);
      return;
    }

    final logInInfo = await _logInInfoSetting.get();
    if (logInInfo == null) {
      await _model.refreshFuture;
      _phoneInputRoute.replace(null);
      return;
    } else {
      _logInInfoBox.data = logInInfo;
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
