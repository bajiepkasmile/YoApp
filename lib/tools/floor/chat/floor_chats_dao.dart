import 'package:floor/floor.dart';
import 'package:yo_app/tools/floor/chat/floor_chat.dart';

@dao
abstract class FloorChatsDao {

  @Query("SELECT * FROM chat")
  Future<List<FloorChat>> getAll();

  @transaction
  Future<void> replaceAll(List<FloorChat> chats) async {
    await deleteAll();
    await insertAll(chats);
  }

  @insert
  Future<void> insertAll(List<FloorChat> chats);

  @Query("DELETE from chat")
  Future<void> deleteAll();
}
