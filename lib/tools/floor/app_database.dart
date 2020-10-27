import 'package:floor/floor.dart';
import 'package:yo_app/tools/floor/achievement/floor_achievement.dart';
import 'package:yo_app/tools/floor/chat/floor_chat.dart';
//import 'package:path/path.dart';
//import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:yo_app/tools/floor/chat/floor_chats_dao.dart';
import 'package:yo_app/tools/floor/contact/floor_contact_general_info.dart';
import 'package:yo_app/tools/floor/contact/floor_contact_general_infos_dao.dart';

import 'achievement/floor_achievements_dao.dart';

//part 'database.g.dart'; // the generated code will be there

const String DATABASE_NAME = "get_like.db";

@Database(version: 1, entities: [FloorGeneralInfoContact, FloorChat, FloorAchievement])
abstract class AppDatabase extends FloorDatabase {

  FloorContactGeneralInfosDao get contactGeneralInfosDao;
  FloorChatsDao get chatsDao;
  FloorAchievementsDao get achievementsDao;
}


void asd() async {
  final database = await $FloorAppDatabase.databaseBuilder(DATABASE_NAME).build();
  final person = await database.findPersonById(1);
}
