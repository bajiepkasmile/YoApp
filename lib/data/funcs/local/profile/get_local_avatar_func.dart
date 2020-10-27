import 'dart:io';

import 'package:architecture/common/async_func.dart';
import 'package:yo_app/models/avatar.dart';

class GetLocalAvatarFunc extends AsyncFunc<String, Avatar> {

  final String _temporaryDirectoryPath;

  GetLocalAvatarFunc(this._temporaryDirectoryPath);

  @override
  Future<Avatar> call(String name) async => Avatar(File("$_temporaryDirectoryPath/$name"), name);
}
