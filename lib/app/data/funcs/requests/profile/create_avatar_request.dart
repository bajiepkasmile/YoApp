import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:yo_app/architecture/common/async_func.dart';

class CreateAvatarRequest extends AsyncFunc<File, void> {

  final FirebaseStorage _firebaseStorage;

  CreateAvatarRequest(this._firebaseStorage);

  @override
  Future<void> call(File file) async {
    await _firebaseStorage.ref().putFile(file).onComplete;
  }
}
