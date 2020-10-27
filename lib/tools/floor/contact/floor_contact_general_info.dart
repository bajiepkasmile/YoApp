import 'package:floor/floor.dart';

@Entity(tableName: "contact_general_info")
class FloorGeneralInfoContact {

  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: "floor_id")
  final int floorId = null;
  @ColumnInfo(name: "id")
  final String id;
  @ColumnInfo(name: "phone")
  final String phone;
  @ColumnInfo(name: "avatar_name")
  final String avatarName;
  @ColumnInfo(name: "name")
  final String name;
  @ColumnInfo(name: "likes_count")
  final int likesCount;
  @ColumnInfo(name: "is_in_app")
  final bool isInApp;

  FloorGeneralInfoContact(
      this.id,
      this.phone,
      this.avatarName,
      this.name,
      this.likesCount,
      this.isInApp
  );
}
