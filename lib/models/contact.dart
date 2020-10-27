import 'avatar.dart';
import 'chat.dart';
import 'profile.dart';
import 'achievement.dart';

class Contact extends Profile {

  final Chat chat;
  final bool isInApp;

  bool get canSendLike => likesCount != 1000000 && chat.totalSentLikesCount != 10000;

  Contact(
      String id,
      String phone,
      Avatar avatar,
      String name,
      int likesCount,
      List<Achievement> achievements,
      this.chat,
      this.isInApp
  ) : super(id, phone, avatar, name, likesCount, achievements, []);
}
