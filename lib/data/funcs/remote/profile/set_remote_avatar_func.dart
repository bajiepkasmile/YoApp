import 'dart:io';

import 'package:architecture/common/async_func.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SetRemoteAvatarFunc extends AsyncFunc<File, String> {

  final FirebaseStorage _firebaseStorage;

  SetRemoteAvatarFunc(this._firebaseStorage);

  @override
  Future<String> call(File avatarFile) async {
    final snapshot = await _firebaseStorage.ref().putFile(avatarFile).onComplete;
    return snapshot.storageMetadata.name;
  }
}
