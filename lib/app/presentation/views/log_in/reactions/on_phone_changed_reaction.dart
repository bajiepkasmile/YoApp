import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../log_in_model.dart';

class OnPhoneChangedReaction extends Reaction<String> {
  
  final LogInModel _logInModel;

  OnPhoneChangedReaction(this._logInModel);

  @override
  void excite(String phone) {
    _logInModel.phone = phone;
  }
}
