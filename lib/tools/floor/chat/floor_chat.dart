import 'package:floor/floor.dart';

@Entity(tableName: "chat")
class FloorChat {

  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: "floor_id")
  final int floorId = null;
  @ColumnInfo(name: "profile_id")
  final String profileId;
  @ColumnInfo(name: "hi_milliseconds_since_epoch")
  final int hiMillisecondsSinceEpoch;
  @ColumnInfo(name: "contact_hi_milliseconds_since_epoch")
  final int contactHiMillisecondsSinceEpoch;
  @ColumnInfo(name: "is_contact_hi_viewed")
  final bool isContactHiViewed;
  @ColumnInfo(name: "total_sent_likes_count")
  final int totalSentLikesCount;
  @ColumnInfo(name: "last_received_likes_count")
  final int lastReceivedLikesCount;
  @ColumnInfo(name: "is_last_received_likes_count_viewed")
  final bool isLastReceivedLikesCountViewed;
  @ColumnInfo(name: "last_received_likes_milliseconds_since_epoch")
  final int lastReceivedLikesMillisecondsSinceEpoch;

  FloorChat(
      this.profileId,
      this.hiMillisecondsSinceEpoch,
      this.contactHiMillisecondsSinceEpoch,
      this.isContactHiViewed,
      this.totalSentLikesCount,
      this.lastReceivedLikesCount,
      this.isLastReceivedLikesCountViewed,
      this.lastReceivedLikesMillisecondsSinceEpoch
  );
}
