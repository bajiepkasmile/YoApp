import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../architecture/data/emitter/emitter.dart';
import '../../tools/firestore/firestore_entry.dart';
import '../../tools/firestore/message/firestore_message.dart';
import '../../tools/firestore/message/firestore_message_mapper.dart';
//import '../../models/message.dart';

//class OnReceiveMessageEmitter extends Emitter<Message> {
//
//  OnReceiveMessageEmitter(
//      FirestoreEntry firestoreEntry,
//      FirestoreMessageMapper mapper
//  ) {
//    firestoreEntry
//        .messages
//        .reference
//        .snapshots()
//        .expand((snapshot) => snapshot.documentChanges)
//        .where((change) => change.type == DocumentChangeType.added)
//        .map((addedChange) => addedChange.document)
//        .asyncMap((documentSnapshot) => FirestoreMessage.fromSnapshot(documentSnapshot))
//        .asyncMap(mapper.toMessage)
//        .forEach(emitEvent);
//  }
//}
