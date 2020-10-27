import 'dart:async';

import 'package:architecture/common/async_func.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyPhoneFunc extends AsyncFunc<String, VerifyPhoneFuncResult> {

  final FirebaseAuth _firebaseAuth;

  VerifyPhoneFunc(this._firebaseAuth);

  @override
  Future<VerifyPhoneFuncResult> call(String phone) {
    final completer = Completer<VerifyPhoneFuncResult>();

    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (authCredential) =>
          completer.complete(VerifyPhoneFuncResult(authCredential: authCredential)),
      verificationFailed: (exception) => completer.completeError(exception),
      codeSent: (verificationId, [forceResendingToken]) =>
          completer.complete(VerifyPhoneFuncResult(verificationId: verificationId)),
      codeAutoRetrievalTimeout: null,
    );

    return completer.future;
  }
}

class VerifyPhoneFuncResult {

  final AuthCredential authCredential;
  final String verificationId;

  VerifyPhoneFuncResult({this.authCredential, this.verificationId});
}
