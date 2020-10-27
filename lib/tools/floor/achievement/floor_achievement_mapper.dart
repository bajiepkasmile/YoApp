import 'package:flutter/painting.dart';
import 'package:yo_app/models/achievement.dart';
import 'package:yo_app/models/achievement_with_profile_id.dart';
import 'package:yo_app/models/emoji.dart';
import 'package:yo_app/tools/floor/achievement/floor_achievement.dart';

class FloorAchievementMapper {

  FloorAchievement fromAchievementWithProfileId(AchievementWithProfileId achievementWithProfileId) =>
      FloorAchievement(
          achievementWithProfileId.achievement.id,
          achievementWithProfileId.profileId,
          _emojiToInt(achievementWithProfileId.achievement.emoji),
          achievementWithProfileId.achievement.description,
          achievementWithProfileId.achievement.color.value
      );

  AchievementWithProfileId toAchievementWithProfileId(FloorAchievement floorAchievement) =>
      AchievementWithProfileId(
          Achievement(
              floorAchievement.id,
              _intToEmoji(floorAchievement.emojiId),
              floorAchievement.description,
              Color(floorAchievement.colorHex)
          ),
          floorAchievement.profileId
      );

  int _emojiToInt(Emoji emoji) {
    switch(emoji) {
      case Emoji.heartEyes: return 0;
      case Emoji.squinting: return 1;
      case Emoji.sunglasses: return 2;
      case Emoji.thumbsUp: return 3;
      default: return null;
    }
  }

  Emoji _intToEmoji(int value) {
    switch(value) {
      case 0: return Emoji.heartEyes;
      case 1: return Emoji.squinting;
      case 2: return Emoji.sunglasses;
      case 3: return Emoji.thumbsUp;
      default: return null;
    }
  }
}
