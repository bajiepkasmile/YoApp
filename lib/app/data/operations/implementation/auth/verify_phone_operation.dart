import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../architecture/data/operation/operation.dart';

class VerifyPhoneOperation extends Operation<String, VerifyPhoneResult> {

  final FirebaseAuth _firebaseAuth;

  VerifyPhoneOperation(this._firebaseAuth);

  @override
  Future<VerifyPhoneResult> execute(String phone) {
    final completer = Completer<VerifyPhoneResult>();

    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (authCredential) =>
          completer.complete(VerifyPhoneResult(authCredential: authCredential)),
      verificationFailed: (exception) => completer.completeError(exception),
      codeSent: (verificationId, [forceResendingToken]) =>
          completer.complete(VerifyPhoneResult(verificationId: verificationId)),
      codeAutoRetrievalTimeout: null,
    );

    return completer.future;
  }
}

class VerifyPhoneResult {

  final AuthCredential authCredential;
  final String verificationId;

  VerifyPhoneResult({ this.authCredential, this.verificationId });
}
