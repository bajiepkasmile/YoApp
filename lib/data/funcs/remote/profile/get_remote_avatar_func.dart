import 'dart:io';

import 'package:architecture/common/async_func.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:yo_app/models/avatar.dart';

class GetRemoteAvatarFunc extends AsyncFunc<String, Avatar> {

  final FirebaseStorage _firebaseStorage;

  GetRemoteAvatarFunc(this._firebaseStorage);

  @override
  Future<Avatar> call(String avatarName) async {
    final rawPath = await _firebaseStorage.ref().child(avatarName).getData(1024 * 1024);
    return Avatar(File.fromRawPath(rawPath), avatarName);
  }
}
