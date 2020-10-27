import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_utils/firestore_collection.dart';
import 'package:yo_app/tools/firestore/profile/firestore_profile.dart';

class FirestoreEntry {

  static const PROFILES = "profiles";

  final FirestoreCollection<FirestoreProfile> profiles;

  FirestoreEntry(Firestore firestore) :
        profiles = FirestoreCollection(
            firestore.collection(PROFILES),
            (snapshot) => FirestoreProfile.fromSnapshot(snapshot)
        )
  ;
}

class FirestoreTables {

  static const PROFILES = "profiles";
  static const CHATS = "chats";
}
