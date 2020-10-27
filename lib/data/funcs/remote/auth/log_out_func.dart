import 'package:architecture/common/async_func.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogOutFunc extends AsyncFunc<void, void> {

  final FirebaseAuth _firebaseAuth;

  LogOutFunc(this._firebaseAuth);

  @override
  Future<void> call(void arg) => _firebaseAuth.signOut();
}
