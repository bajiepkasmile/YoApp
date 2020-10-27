import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:yo_app/models/input_status.dart';
import 'package:yo_app/presentation/views/splash/reactions/funcs/get_profile_func.dart';
import 'package:yo_app/presentation/views/splash/splash_model.dart';

class OnConnectivityChangedReaction extends Reaction<bool> {

  final GetProfileFunc _getProfileFunc;
  final SplashModel _model;

  OnConnectivityChangedReaction(this._getProfileFunc, this._model);

  @override
  void excite(bool isConnected) {
    if (isConnected && _model.status == InputStatus.error) {
      _model.status = InputStatus.loading;
      _model.refresh();
      _getProfileFunc.call(null);
    }
  }
}
