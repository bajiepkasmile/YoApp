import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:yo_app/presentation/views/sms_input/reactions/funcs/log_in_by_sms_code_func.dart';
import 'package:yo_app/presentation/views/sms_input/sms_input_model.dart';

class OnSmsCodeChangedReaction extends Reaction<String> {
  
  final SmsInputModel _model;
  final LogInBySmsCodeFunc _logInBySmsCodeFunc;

  OnSmsCodeChangedReaction(this._model, this._logInBySmsCodeFunc);

  @override
  void excite(String smsCode) {
    _model.smsCode = smsCode;
    if (smsCode.length == 6) {
      _logInBySmsCodeFunc.call(null);
    }
  }
}
