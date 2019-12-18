import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../data/operations/implementation/auth/confirm_log_in_operation.dart';
import '../../../../data/repositories/self_profile_repository.dart';
import '../log_in_model.dart';

class OnSmsCodeSubmittedReaction extends Reaction<void> {

  final LogInModel _logInModel;
  final ConfirmLogInOperation _confirmLogInOperation;
  final SelfProfileRepository _selfProfileRepository;

  OnSmsCodeSubmittedReaction(
      this._logInModel,
      this._confirmLogInOperation,
      this._selfProfileRepository
  );

  @override
  void excite(void arg) async {
    _logInModel.isLoading = true;
    _logInModel.refresh();

    _selfProfileRepository.data = await _confirmLogInOperation.execute(_logInModel.smsCode);
  }
}
