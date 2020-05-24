import 'package:yo_app/app/models/chat.dart';
import 'package:yo_app/architecture/data/task/task.dart';

class SendHiTask extends Task<Chat, Chat> {

  @override
  Future<Chat> createTaskFuture(Chat arg) {
    // TODO: implement createTaskFuture
    return Future.value();
  }
}
