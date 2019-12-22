import 'message_status.dart';

class Message {

  final String id;
  final String senderProfileId;
  final MessageStatus status;
  final String text;
  final bool isOwner;
  final localTimestamp;

  Message(this.id, this.senderProfileId, this.status, this.text, this.isOwner, this.localTimestamp);
}
