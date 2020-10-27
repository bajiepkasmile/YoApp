import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:connectivity_utils/architecture/data/func/is_network_available_func.dart';
import 'package:yo_app/presentation/views/sms_input/reactions/funcs/start_timer_func.dart';
import 'package:yo_app/presentation/views/sms_input/sms_input_model.dart';

class OnSendSmsReaction extends Reaction<void> {

  final IsNetworkAvailableFunc _isNetworkAvailableFunc;
  final VerifyPhoneRequest _verifyPhoneRequest;
  final StartTimerFunc _startTimerFunc;
  final SmsInputModel _model;

  OnSendSmsReaction(this._isNetworkAvailableFunc, this._verifyPhoneRequest, this._startTimerFunc, this._model);

  @override
  void excite(void arg) async {
    final isNetworkAvailable = await _isNetworkAvailableFunc.call(null);
    if (!isNetworkAvailable) {
      return;
    }

    _startTimerFunc.call(null);

    try {
      final result = await _verifyPhoneRequest.call(_model.arg.phone);
      _model.verificationId = result.verificationId;
    } catch (e) {
      _model.secondsLeft = 0;
      _model.refresh();
    }
  }
}
