import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../architecture/data/operation/operation.dart';

class VerifyPhoneOperation extends Operation<String, VerifyPhoneOperationResult> {

  final FirebaseAuth _firebaseAuth;

  VerifyPhoneOperation(this._firebaseAuth);

  @override
  Future<VerifyPhoneOperationResult> execute(String phone) {
    final completer = Completer<VerifyPhoneOperationResult>();

    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (authCredential) =>
          completer.complete(VerifyPhoneOperationResult(authCredential: authCredential)),
      verificationFailed: (exception) => completer.completeError(exception),
      codeSent: (verificationId, [forceResendingToken]) =>
          completer.complete(VerifyPhoneOperationResult(verificationId: verificationId)),
      codeAutoRetrievalTimeout: null,
    );

    return completer.future;
  }
}

class VerifyPhoneOperationResult {

  final AuthCredential authCredential;
  final String verificationId;

  VerifyPhoneOperationResult({ this.authCredential, this.verificationId });
}
