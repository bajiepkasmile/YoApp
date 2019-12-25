import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../../firestore_utils/firestore_object.dart';

class FirestoreMessage extends FirestoreObject {
  
  static const SENDER_PROFILE_ID_KEY = "sender_profile_id"; 
  static const RECEIVER_PROFILE_ID_KEY = "receiver_profile_id";

  final String senderProfileId;
  final String receiverProfileId;

  FirestoreMessage(String id, this.senderProfileId, this.receiverProfileId) : super(id);

  FirestoreMessage.fromSnapshot(DocumentSnapshot snapshot) : this(
      snapshot.documentID,
      snapshot[SENDER_PROFILE_ID_KEY],
      snapshot[RECEIVER_PROFILE_ID_KEY]
  );

  @override
  void addFieldsToMap(Map<String, dynamic> map) {
    map[SENDER_PROFILE_ID_KEY] = senderProfileId;
    map[RECEIVER_PROFILE_ID_KEY] = receiverProfileId;
  }
}
