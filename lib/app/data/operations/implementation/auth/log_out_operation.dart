import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../architecture/data/operation/operation.dart';

class LogOutOperation extends Operation<void, void> {

  final FirebaseAuth _firebaseAuth;

  LogOutOperation(this._firebaseAuth);

  @override
  Future<void> execute(void arg) => _firebaseAuth.signOut();
}
