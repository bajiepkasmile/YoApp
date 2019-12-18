import '../../../../model/profile.dart';
import '../../../../model/message.dart';
import '../../../../model/message_status.dart';

class MockData {

  static final selfProfile = Profile("", "", _selfAvatarUrl, "somenickname", "some name");

  static final contacts = [
    Profile("", "", _contactAvatarUrl, "somenickname0", "some name 0"),
    Profile("", "", _contactAvatarUrl, "somenickname1", "some name 1"),
    Profile("", "", _contactAvatarUrl, "somenickname2", "some name 2"),
    Profile("", "", _contactAvatarUrl, "somenickname3", "some name 3"),
    Profile("", "", _contactAvatarUrl, "somenickname4", "some name 4"),
    Profile("", "", _contactAvatarUrl, "somenickname5", "some name 5"),
    Profile("", "", _contactAvatarUrl, "somenickname6", "some name 6"),
    Profile("", "", _contactAvatarUrl, "somenickname7", "some name 7"),
    Profile("", "", _contactAvatarUrl, "somenickname8", "some name 8"),
    Profile("", "", _contactAvatarUrl, "somenickname9", "some name 9"),
  ];

  static final messages = [
    Message("", "", MessageStatus.SENT, "Yo", true, 0),
    Message("", "", MessageStatus.SENT, "Yo", false, 0),
    Message("", "", MessageStatus.SENT, "Yo", true, 0),
    Message("", "", MessageStatus.SENT, "Yo", true, 0),
    Message("", "", MessageStatus.SENT, "Yo", false, 0),
    Message("", "", MessageStatus.SENT, "Yo", false, 0),
    Message("", "", MessageStatus.SENT, "Yo", true, 0),
    Message("", "", MessageStatus.SENT, "Yo", false, 0),
    Message("", "", MessageStatus.SENT, "Yo", true, 0),
    Message("", "", MessageStatus.SENT, "Yo", false, 0),
    Message("", "", MessageStatus.SENT, "Yo", true, 0),
  ];

  static final _selfAvatarUrl = "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/19/19b952baf75c85034108858df0ce37c752a1a574_full.jpg";
  static final _contactAvatarUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8PVMg0rOyZcxCWgke0IiPAtHFFe6wpAiNvHv_1om4tkh1GfBJ&s";
}
