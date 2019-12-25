import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../architecture/data/emitter/emitter.dart';
import '../../model/message.dart';
import '../operations/tools/firestore/firestore_entry.dart';
import '../operations/tools/firestore/message/firestore_message.dart';
import '../operations/tools/firestore/message/firestore_message_mapper.dart';
import '../repositories/self_profile_repository.dart';

class OnReceiveMessageEmitter extends Emitter<Message> {

  OnReceiveMessageEmitter(
      FirestoreEntry firestoreEntry,
      FirestoreMessageMapper mapper,
      SelfProfileRepository selfProfileRepository
  ) {
    final selfId = selfProfileRepository.data.id;
    firestoreEntry
        .messages
        .reference
        .snapshots()
        .expand((snapshot) => snapshot.documentChanges)
        .where((change) => change.type == DocumentChangeType.added)
        .map((addedChange) => addedChange.document)
        .asyncMap((documentSnapshot) => FirestoreMessage.fromSnapshot(documentSnapshot))
        .asyncMap(mapper.toMessage)
        .where((message) => message.receiverProfileId == selfId)
        .forEach(emitEvent);
  }
}
