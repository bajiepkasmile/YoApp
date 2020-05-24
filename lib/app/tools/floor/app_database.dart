import 'dart:async';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:yo_app/app/tools/floor/achievement/floor_achievement.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [FloorAchievement])
abstract class AppDatabase extends FloorDatabase {
  FloorAchievementDao get floorDao;
}

/*
final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

 final person = await database.findPersonById(1);
 await database.insertPerson(person);
 */
