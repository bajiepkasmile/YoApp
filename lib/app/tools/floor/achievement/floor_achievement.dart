import 'package:floor/floor.dart';

@entity
class FloorAchievement {

  @primaryKey
  final String id;
  final String contactId;
  final int emojiId;
  final String description;
  final int colorHex;

  FloorAchievement(this.id, this.contactId, this.emojiId, this.description, this.colorHex);
}

@dao
abstract class FloorAchievementDao {

  @Query('SELECT * FROM achievements WHERE id = :id')
  Future<List<FloorAchievement>> execute();
}
