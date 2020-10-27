import 'package:floor/floor.dart';
import 'package:yo_app/tools/floor/achievement/floor_achievement.dart';

@dao
abstract class FloorAchievementsDao {

  @Query('SELECT * FROM achievement')
  Future<List<FloorAchievement>> getAll();

  @transaction
  Future<void> replaceAll(List<FloorAchievement> achievements) async {
    await deleteAll();
    await insertAll(achievements);
  }

  @insert
  Future<void> insertAll(List<FloorAchievement> achievements);

  @Query("DELETE FROM achievement")
  Future<void> deleteAll();
}
