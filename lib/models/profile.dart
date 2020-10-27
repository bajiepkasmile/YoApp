import 'dart:io';

import 'avatar.dart';
import 'achievement.dart';
import 'contact.dart';

class Profile {

  final String id;
  final String phone;
  final Avatar avatar;
  final String name;
  final int likesCount;
  final List<Achievement> achievements;
  final List<Contact> contacts;

  Profile(this.id, this.phone, this.avatar, this.name, this.likesCount, this.achievements, this.contacts);

  Profile copy({
      String id,
      String phone,
      Avatar avatar,
      String name,
      int likesCount,
      List<Achievement> achievements,
      List<Contact> contacts
  }) => Profile(
      id != null ? id : this.id,
      phone != null ? phone : this.phone,
      avatar != null ? avatar : this.avatar,
      name != null ? name : this.name,
      likesCount != null ? likesCount : this.likesCount,
      achievements != null ? achievements : this.achievements,
      contacts != null ? contacts : this.contacts
  );
}
