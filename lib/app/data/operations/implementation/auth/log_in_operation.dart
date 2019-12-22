import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../architecture/data/operation/operation.dart';

class LogInOperation extends Operation<LogInArg, String> {

  final FirebaseAuth _firebaseAuth;

  LogInOperation(this._firebaseAuth);

  @override
  Future<String> execute(LogInArg arg) async {
    final authResult = await _firebaseAuth.signInWithCredential(arg.authCredential);
    return authResult.user.uid;
  }
}

class LogInArg {

  final AuthCredential authCredential;

  LogInArg.fromAuthCredential(this.authCredential);

  LogInArg.fromVerificationIdAndSmsCode(String verificationId, String smsCode) :
        authCredential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode)
  ;
}
