class FloorChat {

  final DateTime hiTime;
  final DateTime contactHiTime;
  final bool isContactHiViewed;
  final int totalSentLikesCount;
  final int lastReceivedLikesCount;
  final bool isLastReceivedLikesCountViewed;
  final DateTime lastMessageTime;

  FloorChat(
      this.hiTime,
      this.contactHiTime,
      this.isContactHiViewed,
      this.totalSentLikesCount,
      this.lastReceivedLikesCount,
      this.isLastReceivedLikesCountViewed,
      this.lastMessageTime
  );
}
