import 'dart:ui';

import 'package:architecture/data/box/box.dart';
import 'package:yo_app/models/achievement.dart';
import 'package:yo_app/models/emoji.dart';
import 'package:yo_app/models/profile.dart';

class ProfileBox extends Box<Profile> {

  ProfileBox() {
    data = Profile(
      "",
      "",
      null,
      "Angelina",
      1000000,
      [
        Achievement(
            "",
            Emoji.thumbsUp,
            "Put 1 000 000 likes to friends and get the Super prize",
            Color(0xFFCFECFF)
        ),
        Achievement(
            "",
            Emoji.squinting,
            "You put 100 000 likes, keep up the good work",
            Color(0xFFFFE18C)
        ),
        Achievement(
            "",
            Emoji.heartEyes,
            "You put 500 000 likes, keep up the good work",
            Color(0xFFFFC8B8)
        ),
        Achievement(
            "",
            Emoji.sunglasses,
            "You put 1 000 000 likes, keep up the good work",
            Color(0xFF8979E0)
        )
      ],
      []
    );
  }
}
