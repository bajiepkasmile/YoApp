import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../models/input_status.dart';
import '../../../utils/phone_formatter.dart';
import '../../new_contact/new_contact_model.dart';

class OnPhoneChangedReaction extends Reaction<String> {

  final NewContactModel _model;
  final PhoneFormatter _phoneFormatter;

  OnPhoneChangedReaction(this._model, this._phoneFormatter);

  @override
  void excite(String phone) async {
    final isPhoneValid = await _phoneFormatter.isValid("+$phone");
    _model.phone = phone;
    _model.status = isPhoneValid ? InputStatus.active : InputStatus.inactive;
    _model.refresh();
  }
}
