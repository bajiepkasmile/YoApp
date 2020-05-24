import '../../../../../connectivity_utils/architecture/data/func/is_network_available_func.dart';
import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../data/funcs/requests/auth/log_in_request.dart';
import '../../../../data/funcs/requests/auth/verify_phone_request.dart';
import '../../../../models/input_status.dart';
import '../../../common/log_in/log_in_func.dart';
import '../../sms_input/sms_input_arg.dart';
import '../../sms_input/sms_input_route.dart';
import '../phone_input_model.dart';

class OnPhoneSubmittedReaction extends Reaction<void> {

  final IsNetworkAvailableFunc _isNetworkAvailableFunc;
  final VerifyPhoneRequest _verifyPhoneRequest;
  final LogInFunc _logInFunc;
  final SmsInputRoute _smsInputRoute;
  final PhoneInputModel _model;

  OnPhoneSubmittedReaction(
      this._isNetworkAvailableFunc,
      this._verifyPhoneRequest,
      this._logInFunc,
      this._smsInputRoute,
      this._model,
  );

  @override
  void excite(void arg) async {
    final isNetworkAvailable = await _isNetworkAvailableFunc.call(null);
    if (!isNetworkAvailable) {
      _refreshWithError();
      return;
    }

    _model.status = InputStatus.loading;
    _model.refresh();

    try {
      await _verifyPhoneUnsafe();
    } catch (e) {
      _refreshWithError();
    }
  }

  Future _verifyPhoneUnsafe() async {
    final result = await _verifyPhoneRequest.call("+${_model.phone}");
    if (result.authCredential != null) {
      final logInArg = LogInRequestArg.fromAuthCredential(result.authCredential);
      await _logInFunc.call(logInArg);
    } else {
      _model.status = InputStatus.active;
      _model.refresh();
      final smsInputArg = SmsInputArg(result.verificationId, "+${_model.phone}");
      _smsInputRoute.add(smsInputArg);
    }
  }

  void _refreshWithError() {
    _model.status = InputStatus.error;
    _model.refresh();
  }
}
