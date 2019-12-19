import '../../../../model/profile.dart';
import '../../../../model/message.dart';
import '../../../../model/message_status.dart';

class MockData {

  static final selfProfile = Profile("", "", _selfAvatarUrl, "some name");

  static final contacts = [
    Profile("", "", _contactAvatarUrl, "some name 0"),
    Profile("", "", _contactAvatarUrl, "some name 1"),
    Profile("", "", _contactAvatarUrl, "some name 2"),
    Profile("", "", _contactAvatarUrl, "some name 3"),
    Profile("", "", _contactAvatarUrl, "some name 4"),
    Profile("", "", _contactAvatarUrl, "some name 5"),
    Profile("", "", _contactAvatarUrl, "some name 6"),
    Profile("", "", _contactAvatarUrl, "some name 7"),
    Profile("", "", _contactAvatarUrl, "some name 8"),
    Profile("", "", _contactAvatarUrl, "some name 9"),
  ];

  static final messages = [
    Message("", "", MessageStatus.sent, "Yo", true, 0),
    Message("", "", MessageStatus.sent, "Yo", false, 0),
    Message("", "", MessageStatus.sent, "Yo", true, 0),
    Message("", "", MessageStatus.sent, "Yo", true, 0),
    Message("", "", MessageStatus.sent, "Yo", false, 0),
    Message("", "", MessageStatus.sent, "Yo", false, 0),
    Message("", "", MessageStatus.sent, "Yo", true, 0),
    Message("", "", MessageStatus.sent, "Yo", false, 0),
    Message("", "", MessageStatus.sent, "Yo", true, 0),
    Message("", "", MessageStatus.sent, "Yo", false, 0),
    Message("", "", MessageStatus.sent, "Yo", true, 0),
  ];

  static final _selfAvatarUrl = "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/19/19b952baf75c85034108858df0ce37c752a1a574_full.jpg";
  static final _contactAvatarUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8PVMg0rOyZcxCWgke0IiPAtHFFe6wpAiNvHv_1om4tkh1GfBJ&s";
}
