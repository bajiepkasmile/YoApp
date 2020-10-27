import 'package:architecture/data/box/box.dart';
import 'package:yo_app/models/chat.dart';
import 'package:yo_app/models/contact.dart';

class ContactsBox extends Box<List<Contact>> {

  ContactsBox() {
    data = [
        Contact("", "", null, "Name0", 0, [], a[0], true),
        Contact("", "", null, "Name1", 0, [], a[1], true),
        Contact("", "", null, "Name2", 0, [], a[2], true),
        Contact("", "", null, "Name3", 0, [], a[3], true),
        Contact("", "", null, "Name4", 0, [], a[4], false),
        Contact("", "", null, "Name5", 0, [], a[5], false),
        Contact("", "", null, "Name6", 0, [], a[6], false),
        Contact("", "", null, "Name7", 0, [], a[7], false),
        Contact("", "", null, "Name8", 0, [], a[8], false),
        Contact("", "", null, "Name9", 0, [], a[9], false)
    ];
  }
}

final a = [
  Chat(null, null, false, 100, 0, true, DateTime.now()),
  Chat(null, null, true, 100, 10, false, DateTime.now().subtract(Duration(hours: 2, minutes: 20))),
  Chat(null, null, false, 100, 0, true, DateTime.now().subtract(Duration(hours: 23, minutes: 58))),
  Chat(null, null, false, 100, 10, false, DateTime.now().subtract(Duration(days: 1))),
  Chat(null, null, false, 100, 10, true, DateTime.now().subtract(Duration(days: 1, minutes: 1))),
  Chat(null, null, true, 100, 110, true, DateTime.now().subtract(Duration(days: 2))),
  Chat(null, null, true, 100, 1110, true, DateTime.now().subtract(Duration(days: 3))),
  Chat(null, null, true, 100, 10, true, DateTime.now().subtract(Duration(days: 4))),
  Chat(null, null, true, 100, 10, true, DateTime.now().subtract(Duration(days: 5))),
  Chat(null, null, true, 100, 10, true, DateTime.now().subtract(Duration(days: 6))),
];
