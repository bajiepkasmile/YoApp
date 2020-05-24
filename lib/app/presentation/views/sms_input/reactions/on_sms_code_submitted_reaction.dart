import '../../../../../architecture/presentation/reaction/reaction.dart';
import 'funcs/log_in_by_sms_code_func.dart';

class OnSmsCodeSubmittedReaction extends Reaction<void> {

  final LogInBySmsCodeFunc _logInBySmsCodeFunc;

  OnSmsCodeSubmittedReaction(this._logInBySmsCodeFunc);

  @override
  void excite(void arg) async {
    _logInBySmsCodeFunc.call(null);
  }
}
