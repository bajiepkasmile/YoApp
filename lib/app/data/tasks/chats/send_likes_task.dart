/*
final selfProfileId = _profileRepository.data.id;
    final arg = SendMessageRequestArg(selfProfileId, contactId);
    return _sendMessageRequest.call(arg);
 */

import 'package:yo_app/app/models/chat.dart';
import 'package:yo_app/architecture/data/task/task.dart';

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
