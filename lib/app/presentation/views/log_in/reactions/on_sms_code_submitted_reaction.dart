import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../data/operations/implementation/auth/log_in_operation.dart';
import '../log_in_model.dart';
import 'common/log_in_common.dart';

class OnSmsCodeSubmittedReaction extends Reaction<void> {

  final LogInModel _logInModel;
  final LogInCommon _logInCommon;

  OnSmsCodeSubmittedReaction(this._logInModel, this._logInCommon);

  @override
  void excite(void arg) async {
    _logInModel.isLoading = true;
    _logInModel.refresh();

    final logInArg = LogInOperationArg.fromVerificationIdAndSmsCode(_logInModel.verificationId, _logInModel.smsCode);
    await _logInCommon.call(logInArg);
  }
}
