import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_utils/firestore_object.dart';

class FirestoreChatPart extends FirestoreObject {

  static const HI_MILLISECONDS_SINCE_EPOCH_KEY = "hi_milliseconds_since_epoch";
  static const IS_HI_VIEWED_KEY = "is_hi_viewed";
  static const TOTAL_SENT_LIKES_COUNT_KEY = "total_sent_likes_count";
  static const LAST_RECEIVED_LIKES_COUNT_KEY = "last_received_likes_count";
  static const IS_LAST_RECEIVED_LIKES_COUNT_VIEWED_KEY = "is_last_received_likes_count_viewed";
  static const LAST_RECEIVED_LIKES_MILLISECONDS_SINCE_EPOCH_KEY = "last_received_likes_milliseconds_since_epoch";

  final int hiMillisecondsSinceEpoch;
  final bool isHiViewed;
  final int totalSentLikesCount;
  final int lastReceivedLikesCount;
  final bool isLastReceivedLikesCountViewed;
  final int lastReceivedLikesMillisecondsSinceEpoch;

  FirestoreChatPart(
      String id,
      this.hiMillisecondsSinceEpoch,
      this.isHiViewed,
      this.totalSentLikesCount,
      this.lastReceivedLikesCount,
      this.isLastReceivedLikesCountViewed,
      this.lastReceivedLikesMillisecondsSinceEpoch
  ) : super(id);

  FirestoreChatPart.fromSnapshot(DocumentSnapshot snapshot) : this(
      snapshot.documentID,
      snapshot[HI_MILLISECONDS_SINCE_EPOCH_KEY],
      snapshot[IS_HI_VIEWED_KEY],
      snapshot[TOTAL_SENT_LIKES_COUNT_KEY],
      snapshot[LAST_RECEIVED_LIKES_COUNT_KEY],
      snapshot[IS_LAST_RECEIVED_LIKES_COUNT_VIEWED_KEY],
      snapshot[LAST_RECEIVED_LIKES_MILLISECONDS_SINCE_EPOCH_KEY]
  );

  @override
  void addFieldsToMap(Map<String, dynamic> map) {
    map[HI_MILLISECONDS_SINCE_EPOCH_KEY] = hiMillisecondsSinceEpoch;
    map[IS_HI_VIEWED_KEY] = isHiViewed;
    map[TOTAL_SENT_LIKES_COUNT_KEY] = totalSentLikesCount;
    map[LAST_RECEIVED_LIKES_COUNT_KEY] = lastReceivedLikesCount;
    map[IS_LAST_RECEIVED_LIKES_COUNT_VIEWED_KEY] = isLastReceivedLikesCountViewed;
    map[LAST_RECEIVED_LIKES_MILLISECONDS_SINCE_EPOCH_KEY] = lastReceivedLikesMillisecondsSinceEpoch;
  }
}
