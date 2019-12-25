import 'message_status.dart';

class Message {

  final String id;
  final String senderProfileId;
  final String receiverProfileId;
  final MessageStatus status;
  final bool isOwner;

  Message(this.id, this.senderProfileId, this.receiverProfileId, this.status, this.isOwner);
}
