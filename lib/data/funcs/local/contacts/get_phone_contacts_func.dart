import 'dart:io';

import 'package:architecture/common/async_func.dart';
import 'package:contacts_service/contacts_service.dart' as Phone;
import 'package:dart_utils/iterable_extension.dart';
import 'package:yo_app/models/avatar.dart';
import 'package:yo_app/models/contact.dart';

class GetPhoneContactsOperation extends AsyncFunc<void, List<Contact>> {

  @override
  Future<List<Contact>> call(void arg) async {
    final phoneContacts = await Phone.ContactsService.getContacts();
    return phoneContacts.map(_phoneContactToContact).whereNotNull().toList();
  }

  Contact _phoneContactToContact(Phone.Contact phoneContact) {
    final phone = phoneContact.phones.first.value;
    if (!phone.startsWith("+")) {
      return null;
    }

    final id = phoneContact.identifier;
    final avatar = phoneContact.avatar != null
        ? Avatar(File.fromRawPath(phoneContact.avatar), id)
        : null;
    final name = phoneContact.displayName;

    return Contact(id, phone, avatar, name, 0, [], null, false);
  }
}
