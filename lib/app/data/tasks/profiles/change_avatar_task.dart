import 'dart:io';

import 'package:yo_app/app/models/profile.dart';
import 'package:yo_app/architecture/data/task/task.dart';

class ChangeAvatarTask extends Task<File, Profile> {
  @override
  Future<Profile> createTaskFuture(File avatarFile) {
    // TODO: implement createTaskFuture
    return Future.value();
  }

}