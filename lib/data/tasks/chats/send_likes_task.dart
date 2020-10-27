import 'package:architecture/data/task/task.dart';
import 'package:yo_app/models/chat.dart';

class SendLikesTask extends Task<SendLikesTaskArg, Chat> {

  @override
  Future<Chat> createTaskFuture(SendLikesTaskArg arg) {
    // TODO: implement createTaskFuture
    return Future.value();
  }
}

class SendLikesTaskArg {
  
  final Chat chat;
  final int likesCount;

  SendLikesTaskArg(this.chat, this.likesCount);
}
