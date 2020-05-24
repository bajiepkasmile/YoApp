import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../architecture/common/async_func.dart';
import '../../../../models/log_in_info.dart';

class LogInRequest extends AsyncFunc<LogInRequestArg, LogInInfo> {

  final FirebaseAuth _firebaseAuth;

  LogInRequest(this._firebaseAuth);

  @override
  Future<LogInInfo> call(LogInRequestArg arg) async {
    final authResult = await _firebaseAuth.signInWithCredential(arg.authCredential);
    return LogInInfo(authResult.user.uid, authResult.user.phoneNumber);
  }
}

class LogInRequestArg {

  final AuthCredential authCredential;

  LogInRequestArg.fromAuthCredential(this.authCredential);

  LogInRequestArg.fromVerificationIdAndSmsCode(String verificationId, String smsCode) :
        authCredential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode)
  ;
}
