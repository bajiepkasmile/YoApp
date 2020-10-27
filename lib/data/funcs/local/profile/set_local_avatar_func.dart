import 'dart:io';

import 'package:architecture/common/async_func.dart';
import 'package:yo_app/models/avatar.dart';

class SetLocalAvatarFunc extends AsyncFunc<Avatar, void> {

  final String _temporaryDirectoryPath;

  SetLocalAvatarFunc(this._temporaryDirectoryPath);

  @override
  Future<void> call(Avatar avatar) async {
    final fileBytes = await avatar.file.readAsBytes();
    final writeFile = File("$_temporaryDirectoryPath/${avatar.name}");
    await writeFile.writeAsBytes(fileBytes);
  }
}
