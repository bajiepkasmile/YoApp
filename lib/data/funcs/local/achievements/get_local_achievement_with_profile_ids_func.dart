import 'package:architecture/common/async_func.dart';
import 'package:yo_app/models/achievement_with_profile_id.dart';
import 'package:yo_app/tools/floor/achievement/floor_achievement_mapper.dart';
import 'package:yo_app/tools/floor/achievement/floor_achievements_dao.dart';

class GetLocalAchievementWithProfileIdsFunc extends AsyncFunc<void, List<AchievementWithProfileId>> {

  final FloorAchievementsDao _dao;
  final FloorAchievementMapper _mapper;

  GetLocalAchievementWithProfileIdsFunc(this._dao, this._mapper);

  @override
  Future<List<AchievementWithProfileId>> call(void arg) async {
    final floorAchievements = await _dao.getAll();
    return floorAchievements.map(_mapper.toAchievementWithProfileId).toList();
  }
}
