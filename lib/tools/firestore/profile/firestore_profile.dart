import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_utils/firestore_object.dart';

class FirestoreProfile extends FirestoreObject {

  static const UID_KEY = "uid";
  static const PHONE_KEY = "phone";
  static const AVATAR_NAME_KEY = "avatar_name";
  static const NAME_KEY = "phone";
  static const LIKES_COUNT_KEY = "likes_count";

  final String uid;
  final String phone;
  final String avatarName;
  final String name;
  final int likesCount;

  FirestoreProfile(String id, this.uid, this.phone, this.avatarName, this.name, this.likesCount) : super(id);

  FirestoreProfile.fromSnapshot(DocumentSnapshot snapshot) : this(
      snapshot.documentID,
      snapshot[UID_KEY],
      snapshot[PHONE_KEY],
      snapshot[AVATAR_NAME_KEY],
      snapshot[NAME_KEY],
      snapshot[LIKES_COUNT_KEY]
  );

  @override
  void addFieldsToMap(Map<String, dynamic> map) {
    map[UID_KEY] = uid;
    map[PHONE_KEY] = phone;
    map[AVATAR_NAME_KEY] = avatarName;
    map[NAME_KEY] = name;
    map[LIKES_COUNT_KEY] = likesCount;
  }
}
