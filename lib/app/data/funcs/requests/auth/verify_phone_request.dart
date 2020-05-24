import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../architecture/common/async_func.dart';

class VerifyPhoneRequest extends AsyncFunc<String, VerifyPhoneRequestResult> {

  final FirebaseAuth _firebaseAuth;

  VerifyPhoneRequest(this._firebaseAuth);

  @override
  Future<VerifyPhoneRequestResult> call(String phone) {
    final completer = Completer<VerifyPhoneRequestResult>();

    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (authCredential) =>
          completer.complete(VerifyPhoneRequestResult(authCredential: authCredential)),
      verificationFailed: (exception) => completer.completeError(exception),
      codeSent: (verificationId, [forceResendingToken = -1]) =>
          completer.complete(VerifyPhoneRequestResult(verificationId: verificationId)),
      codeAutoRetrievalTimeout: null,
    );

    return completer.future;
  }
}

class VerifyPhoneRequestResult {

  final AuthCredential authCredential;
  final String verificationId;

  VerifyPhoneRequestResult({this.authCredential, this.verificationId});
}
