import 'package:phone_number/phone_number.dart';

class PhoneFormatter {

  final PhoneNumber _phoneNumber;

  PhoneFormatter(this._phoneNumber);

  Future<String> format(String phone) async {
    final mapDynamic = await _phoneNumber.format(phone, null);
    return mapDynamic["formatted"];
  }

  Future<bool> isValid(String phone) async {
    try {
      await _phoneNumber.parse(phone);
      return true;
    } catch (e) {
      return false;
    }
  }
}
