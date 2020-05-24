import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../models/input_status.dart';
import '../splash_model.dart';
import 'funcs/get_profile_func.dart';

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
