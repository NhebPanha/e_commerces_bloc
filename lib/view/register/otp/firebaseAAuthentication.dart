// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Firebaseaauthentication {
//   String phoneNumber = "";
//   sendOTP(String phoneNumber) async {
//     this.phoneNumber = phoneNumber;
//     FirebaseAuth auth = FirebaseAuth.instance;
//     ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber(
//       "+855$phoneNumber",
//     );
//     printMessage("OTP Sent to +855 $phoneNumber");
//     return confirmationResult;
//   }

//   authenticateMe(ConfirmationResult confirmationResult, String otp) async {
//     UserCredential userCredential = await confirmationResult.confirm(otp);
//     userCredential.additionalUserInfo!.isNewUser
//         ? printMessage("Successfully Authentication")
//         : printMessage("User already exist");
//   }

//   printMessage(String smg) {
//     debugPrint(smg);
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Firebaseaauthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  /// Step 1: Send OTP
  Future<void> sendOTP(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+855$phoneNumber",
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        printMessage("Phone number automatically verified!");
      },
      verificationFailed: (FirebaseAuthException e) {
        printMessage("Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        printMessage("OTP sent to +855$phoneNumber");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  /// Step 2: Verify OTP
  Future<void> authenticateMe(String otp) async {
    if (_verificationId == null) {
      printMessage("No verificationId available!");
      return;
    }
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        printMessage("Successfully Authenticated (new user)");
      } else {
        printMessage("User already exists");
      }
    } catch (e) {
      printMessage("Error verifying OTP: $e");
    }
  }

  void printMessage(String msg) {
    debugPrint(msg);
  }
}

