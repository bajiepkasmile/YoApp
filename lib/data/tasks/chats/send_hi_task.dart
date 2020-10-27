import 'package:architecture/data/task/task.dart';
import 'package:yo_app/models/chat.dart';

class SendHiTask extends Task<Chat, Chat> {

  @override
  Future<Chat> createTaskFuture(Chat arg) {
    // TODO: implement createTaskFuture
    return Future.value();
  }
}
