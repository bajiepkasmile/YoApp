class Chat {

  final DateTime hiTime;
  final DateTime contactHiTime;
  final bool isContactHiViewed;
  final int totalSentLikesCount;
  final int lastReceivedLikesCount;
  final bool isLastReceivedLikesCountViewed;
  final DateTime lastMessageTime;

  bool get isHiSent => hiTime != null;

  Chat(
      this.hiTime,
      this.contactHiTime,
      this.isContactHiViewed,
      this.totalSentLikesCount,
      this.lastReceivedLikesCount,
      this.isLastReceivedLikesCountViewed,
      this.lastMessageTime
  );
}
