import 'package:floor/floor.dart';

@Entity(tableName: "achievement")
class FloorAchievement {

  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: "floor_id")
  final int floorId = null;
  @ColumnInfo(name: "id")
  final String id;
  @ColumnInfo(name: "profile_id")
  final String profileId;
  @ColumnInfo(name: "emoji_id")
  final int emojiId;
  @ColumnInfo(name: "description")
  final String description;
  @ColumnInfo(name: "color_hex")
  final int colorHex;

  FloorAchievement(this.id, this.profileId, this.emojiId, this.description, this.colorHex);
}
