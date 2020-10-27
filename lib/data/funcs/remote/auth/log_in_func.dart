import 'package:architecture/common/async_func.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yo_app/models/log_in_info.dart';

class LogInFunc extends AsyncFunc<LogInFuncArg, LogInInfo> {

  final FirebaseAuth _firebaseAuth;

  LogInFunc(this._firebaseAuth);

  @override
  Future<LogInInfo> call(LogInFuncArg arg) async {
    final authResult = await _firebaseAuth.signInWithCredential(arg.authCredential);
    return LogInInfo(authResult.user.uid, authResult.user.phoneNumber);
  }
}

class LogInFuncArg {

  final AuthCredential authCredential;

  LogInFuncArg.fromAuthCredential(this.authCredential);

  LogInFuncArg.fromVerificationIdAndSmsCode(String verificationId, String smsCode) :
        authCredential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode)
  ;
}
