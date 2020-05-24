import 'dart:io';

import 'package:yo_app/app/models/achievement.dart';
import 'package:yo_app/app/models/chat.dart';
import 'package:yo_app/app/models/contact.dart';
import 'package:yo_app/app/tools/floor/contact/floor_contact.dart';

class FloorContactMapper {

  @override
  FloorContact fromContact(Contact contact) =>
      FloorContact(
          contact.id,
          contact.phone,
          contact.avatarFile.path,
          contact.name,
          contact.likesCount,
          contact.isInApp
      );

  @override
  Contact toContact(FloorContact floorContact, List<Achievement> achievements, Chat chat) =>
      Contact(
          floorContact.id,
          floorContact.phone,
          File.fromUri(Uri.file(floorContact.filePath)),
          floorContact.name,
          floorContact.likesCount,
          achievements,
          chat,
          floorContact.isInApp
      );
}
