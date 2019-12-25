import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../architecture/data/operation/operation.dart';
import '../../../../model/log_in_info.dart';

class LogInOperation extends Operation<LogInOperationArg, LogInInfo> {

  final FirebaseAuth _firebaseAuth;

  LogInOperation(this._firebaseAuth);

  @override
  Future<LogInInfo> execute(LogInOperationArg arg) async {
    final authResult = await _firebaseAuth.signInWithCredential(arg.authCredential);
    return LogInInfo(authResult.user.uid, authResult.user.phoneNumber);
  }
}

class LogInOperationArg {

  final AuthCredential authCredential;

  LogInOperationArg.fromAuthCredential(this.authCredential);

  LogInOperationArg.fromVerificationIdAndSmsCode(String verificationId, String smsCode) :
        authCredential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode)
  ;
}
