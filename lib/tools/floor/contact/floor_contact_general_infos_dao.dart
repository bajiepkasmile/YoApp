import 'package:floor/floor.dart';
import 'package:yo_app/tools/floor/contact/floor_contact_general_info.dart';

@dao
abstract class FloorContactGeneralInfosDao {

  @Query("SELECT * FROM contact")
  Future<List<FloorGeneralInfoContact>> getAll();

  @transaction
  Future<void> replaceAll(List<FloorGeneralInfoContact> contactGeneralInfos) async {
    await insertAll(contactGeneralInfos);
    await deleteAll();
  }

  @insert
  Future<void> insertAll(List<FloorGeneralInfoContact> contactGeneralInfos);

  @Query("DELETE FROM contact")
  Future<void> deleteAll();
}
