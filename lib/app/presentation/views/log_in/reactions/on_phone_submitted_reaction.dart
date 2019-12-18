import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../data/operations/implementation/auth/log_in_operation.dart';
import '../log_in_model.dart';

class OnPhoneSubmittedReaction extends Reaction<void> {

  final LogInModel _logInModel;
  final LogInOperation _logInOperation;

  OnPhoneSubmittedReaction(this._logInModel, this._logInOperation);

  @override
  void excite(void arg) async {
    _logInModel.isLoading = true;
    _logInModel.refresh();

    await _logInOperation.execute(_logInModel.phone);
    _logInModel.isLoading = false;
    _logInModel.isPhoneSubmitted = true;
    _logInModel.refresh();
  }
}
