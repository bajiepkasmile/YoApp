import '../../../../../model/message.dart';
import '../../../../../model/message_status.dart';
import '../../../../repositories/self_profile_repository.dart';
import 'firestore_message.dart';

class FirestoreMessageMapper {

  final SelfProfileRepository _selfProfileRepository;

  FirestoreMessageMapper(this._selfProfileRepository);

  Message toMessage(FirestoreMessage firestoreMessage) {
    final selfId = _selfProfileRepository.data.id;
    final isOwner = firestoreMessage.id == selfId;
    return Message(
        firestoreMessage.id,
        firestoreMessage.senderProfileId,
        firestoreMessage.receiverProfileId,
        MessageStatus.sent,
        isOwner
    );
  }

  FirestoreMessage toFirestoreMessage(Message message) =>
      FirestoreMessage(message.id, message.senderProfileId, message.receiverProfileId);
}
