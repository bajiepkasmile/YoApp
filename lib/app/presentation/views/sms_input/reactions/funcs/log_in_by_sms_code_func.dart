import '../../../../../../architecture/common/async_func.dart';
import '../../../../../../connectivity_utils/architecture/data/func/is_network_available_func.dart';
import '../../../../../data/funcs/requests/auth/log_in_request.dart';
import '../../../../../models/input_status.dart';
import '../../../../common/log_in/log_in_func.dart';
import '../../sms_input_model.dart';

class LogInBySmsCodeFunc extends AsyncFunc<void, void> {

  final SmsInputModel _model;
  final IsNetworkAvailableFunc _isNetworkAvailableFunc;
  final LogInFunc _logInFunc;

  LogInBySmsCodeFunc(this._model, this._isNetworkAvailableFunc, this._logInFunc);

  @override
  Future<void> call(void arg) async {
    final isNetworkAvailable = await _isNetworkAvailableFunc.call(null);
    if (!isNetworkAvailable) {
      _refreshWithError();
      return null;
    }

    _model.status = InputStatus.loading;
    _model.refresh();

    try {
      final logInArg = LogInRequestArg.fromVerificationIdAndSmsCode(_model.verificationId, _model.smsCode);
      await _logInFunc.call(logInArg);
    } catch (e) {
      _refreshWithError();
    }
  }

  void _refreshWithError() {
    _model.status = InputStatus.error;
    _model.refresh();
  }
}
