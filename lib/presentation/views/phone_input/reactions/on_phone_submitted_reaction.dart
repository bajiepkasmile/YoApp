import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:connectivity_utils/architecture/data/func/is_network_available_func.dart';
import 'package:yo_app/models/input_status.dart';
import 'package:yo_app/presentation/views/phone_input/phone_input_model.dart';
import 'package:yo_app/presentation/views/sms_input/sms_input_arg.dart';
import 'package:yo_app/presentation/views/sms_input/sms_input_route.dart';

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
