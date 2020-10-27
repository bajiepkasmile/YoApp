import 'package:architecture/common/async_func.dart';
import 'package:yo_app/models/achievement_with_profile_id.dart';
import 'package:yo_app/tools/floor/achievement/floor_achievement_mapper.dart';
import 'package:yo_app/tools/floor/achievement/floor_achievements_dao.dart';

class SetLocalAchievementWithProfileIdsFunc extends AsyncFunc<List<AchievementWithProfileId>, void> {

  final FloorAchievementsDao _dao;
  final FloorAchievementMapper _mapper;

  SetLocalAchievementWithProfileIdsFunc(this._dao, this._mapper);

  @override
  Future<void> call(List<AchievementWithProfileId> achievementWithProfileIds) async {
    final floorAchievements = achievementWithProfileIds.map(_mapper.fromAchievementWithProfileId).toList();
    await _dao.replaceAll(floorAchievements);
  }
}
