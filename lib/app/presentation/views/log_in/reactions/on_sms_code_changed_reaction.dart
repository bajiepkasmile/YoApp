import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../log_in_model.dart';

class OnSmsCodeChangedReaction extends Reaction<String> {
  
  final LogInModel _logInModel;

  OnSmsCodeChangedReaction(this._logInModel);

  @override
  void excite(String smsCode) {
    _logInModel.smsCode = smsCode;
  }
}
