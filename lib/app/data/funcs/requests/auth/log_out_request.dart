import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../architecture/common/async_func.dart';

class LogOutRequest extends AsyncFunc<void, void> {

  final FirebaseAuth _firebaseAuth;

  LogOutRequest(this._firebaseAuth);

  @override
  Future<void> call(void arg) => _firebaseAuth.signOut();
}
