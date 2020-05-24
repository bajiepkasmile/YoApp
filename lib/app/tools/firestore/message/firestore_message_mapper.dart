import '../../../data/repositories/profile_box.dart';
import 'firestore_message.dart';

class FirestoreMessageMapper {

  final ProfileBox _profileRepository;

  FirestoreMessageMapper(this._profileRepository);

//  Message toMessage(FirestoreMessage firestoreMessage) {
//    final selfId = _profileRepository.data.id;
//    final isOwner = firestoreMessage.id == selfId;
//    return Message(
//        firestoreMessage.id,
//        firestoreMessage.senderProfileId,
//        firestoreMessage.receiverProfileId,
//        MessageStatus.sent,
//        null,
//        null,
//        isOwner
//    );
//  }
//
//  FirestoreMessage toFirestoreMessage(Message message) =>
//      FirestoreMessage(message.id, message.senderProfileId, message.receiverProfileId);
}
