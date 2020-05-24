import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../firestore_utils/firestore_collection.dart';
import 'profile/firestore_profile.dart';
import 'message/firestore_message.dart';

class FirestoreEntry {

  static const PROFILES = "profiles";
  static const MESSAGES = "messages";

  final FirestoreCollection<FirestoreProfile> profiles;
  final FirestoreCollection<FirestoreMessage> messages;

  FirestoreEntry(Firestore firestore) :
        profiles = FirestoreCollection(
            firestore.collection(PROFILES),
            (snapshot) => FirestoreProfile.fromSnapshot(snapshot)
        ),
        messages = FirestoreCollection(
            firestore.collection(MESSAGES),
            (snapshot) => FirestoreMessage.fromSnapshot(snapshot)
        )
  ;
}
