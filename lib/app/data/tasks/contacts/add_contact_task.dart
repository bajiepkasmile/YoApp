import 'package:yo_app/app/models/contact.dart';
import 'package:yo_app/architecture/data/task/task.dart';

class AddContactTask extends Task<String, Contact> {

  @override
  Future<Contact> createTaskFuture(String arg) async {
//    await Future.delayed(Duration(seconds: 2));
//    return Contact("", "", "", "", false);
  }
}
