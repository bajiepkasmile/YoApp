import 'dart:io';

import 'achievement.dart';
import 'contact.dart';

class Profile {

  final String id;
  final String phone;
  final File avatarFile;
  final String name;
  final int likesCount;
  final List<Achievement> achievements;
  final List<Contact> contacts;

  Profile(this.id, this.phone, this.avatarFile, this.name, this.likesCount, this.achievements, this.contacts);
}
