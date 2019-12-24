import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../architecture/data/operation/operation.dart';
import '../../../../model/log_in_info.dart';

class LogInOperation extends Operation<LogInArg, LogInInfo> {

  final FirebaseAuth _firebaseAuth;

  LogInOperation(this._firebaseAuth);

  @override
  Future<LogInInfo> execute(LogInArg arg) async {
    final authResult = await _firebaseAuth.signInWithCredential(arg.authCredential);
    return LogInInfo(authResult.user.uid, authResult.user.phoneNumber);
  }
}

class LogInArg {

  final AuthCredential authCredential;

  LogInArg.fromAuthCredential(this.authCredential);

  LogInArg.fromVerificationIdAndSmsCode(String verificationId, String smsCode) :
        authCredential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode)
  ;
}
