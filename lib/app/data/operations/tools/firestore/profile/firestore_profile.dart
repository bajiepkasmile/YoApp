import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../../firestore_utils/firestore_object.dart';

class FirestoreProfile extends FirestoreObject {

  static const UID_KEY = "uid";
  static const PHONE_KEY = "phone";
  static const AVATAR_URL_KEY = "phone";
  static const FULL_NAME_KEY = "phone";

  final String uid;
  final String phone;
  final String avatarUrl;
  final String fullName;

  FirestoreProfile(String id, this.uid, this.phone, this.avatarUrl, this.fullName) : super(id);

  FirestoreProfile.fromSnapshot(DocumentSnapshot snapshot) : this(
      snapshot.documentID,
      snapshot[UID_KEY],
      snapshot[PHONE_KEY],
      snapshot[AVATAR_URL_KEY],
      snapshot[AVATAR_URL_KEY]
  );

  @override
  void addFieldsToMap(Map<String, dynamic> map) {
    map[UID_KEY] = uid;
    map[PHONE_KEY] = phone;
    map[AVATAR_URL_KEY] = avatarUrl;
    map[FULL_NAME_KEY] = fullName;
  }
}
