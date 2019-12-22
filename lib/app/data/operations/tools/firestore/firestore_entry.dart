import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../firestore_utils/firestore_collection.dart';
import 'profile/firestore_profile.dart';

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
