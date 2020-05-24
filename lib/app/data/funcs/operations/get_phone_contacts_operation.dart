import 'dart:io';

import 'package:contacts_service/contacts_service.dart' as Phone;

import '../../../../architecture/common/async_func.dart';
import '../../../../dart_utils/iterable_extension.dart';
import '../../../models/contact.dart';

class GetPhoneContactsOperation extends AsyncFunc<void, List<Contact>> {

  @override
  Future<List<Contact>> call(void arg) async {
    final phoneContacts = await Phone.ContactsService.getContacts();
    return phoneContacts.map(_phoneContactToContact).whereNotNull<Contact>().toList();
  }

  Contact _phoneContactToContact(Phone.Contact phoneContact) {
    final id = phoneContact.identifier;
    final avatarFile = File.fromRawPath(phoneContact.avatar);
    final name = phoneContact.displayName;
    final phone = phoneContact.phones.first.value;

    if (phone.startsWith("+")) {
//      return Contact(id, phone, avatarFile, name, 0, null, false);
    } else {
      return null;
    }
  }
}
