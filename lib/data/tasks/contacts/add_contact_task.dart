import 'package:architecture/data/task/task.dart';
import 'package:contacts_service/contacts_service.dart';

class AddContactTask extends Task<String, Contact> {

  @override
  Future<Contact> createTaskFuture(String arg) async {
  }
}
