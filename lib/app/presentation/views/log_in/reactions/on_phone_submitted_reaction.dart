import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../data/operations/implementation/auth/log_in_operation.dart';
import '../../../../data/operations/implementation/auth/verify_phone_operation.dart';
import '../log_in_model.dart';
import 'common/log_in_common.dart';

class OnPhoneSubmittedReaction extends Reaction<void> {

  final LogInModel _logInModel;
  final VerifyPhoneOperation _verifyPhoneOperation;
  final LogInCommon _logInCommon;

  OnPhoneSubmittedReaction(this._logInModel, this._verifyPhoneOperation, this._logInCommon);

  @override
  void excite(void arg) async {
    _logInModel.isLoading = true;
    _logInModel.refresh();

    final result = await _verifyPhoneOperation.execute(_logInModel.phone);
    if (result.authCredential != null) {
      final logInArg = LogInOperationArg.fromAuthCredential(result.authCredential);
      await _logInCommon.call(logInArg);
    } else {
      _logInModel.isLoading = false;
      _logInModel.verificationId = result.verificationId;
      _logInModel.refresh();
    }
  }
}
