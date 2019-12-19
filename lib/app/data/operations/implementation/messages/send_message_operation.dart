import 'package:yo_app/app/model/message_status.dart';

import '../../../../../architecture/data/operation/operation.dart';
import '../../../../model/message.dart';
import '../../../../model/profile.dart';

class SendMessageOperation extends Operation<SendMessageArg, Message> {
  
  @override
  Future<Message> execute(SendMessageArg arg) =>
      Future.delayed(
          Duration(seconds: 5),
          () => Message("", arg.message.senderProfileId, MessageStatus.sent, "Yo", true, arg.message.timestamp)
      );
}

class SendMessageArg {

  final Profile contact;
  final Message message;

  SendMessageArg(this.contact, this.message);
}
