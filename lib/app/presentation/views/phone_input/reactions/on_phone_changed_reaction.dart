import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../models/input_status.dart';
import '../../../utils/phone_formatter.dart';
import '../phone_input_model.dart';

class OnPhoneChangedReaction extends Reaction<String> {
  
  final PhoneInputModel _model;
  final PhoneFormatter _phoneFormatter;

  OnPhoneChangedReaction(this._model, this._phoneFormatter);

  @override
  void excite(String phone) async {
    _model.phone = phone;
    final isPhoneValid = await _phoneFormatter.isValid("+$phone");
    _model.status = isPhoneValid ? InputStatus.active : InputStatus.inactive;
    _model.refresh();
  }
}
