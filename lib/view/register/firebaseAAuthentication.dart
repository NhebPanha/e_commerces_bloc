// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/widgets.dart';

// class FirebaseAutheentication {
//   String phoneNumber = '';
//   SentOtp(String phoneNumber) async {
//     this.phoneNumber = phoneNumber;
//     FirebaseAuth auth = FirebaseAuth.instance;
//     ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber(
//       "+855$phoneNumber",
//     );
//     printMessage("OTP Sent to +855 $phoneNumber");
//     return confirmationResult;
//   }

//   authenticationMe(ConfirmationResult confirmationResult, String otp) async {
//     UserCredential userCredential = await confirmationResult.confirm(otp);
//     userCredential.additionalUserInfo!.isNewUser
//         ? printMessage("Success Authentication")
//         : printMessage("User already exist");
//   }

//   printMessage(String msg) {
//     debugPrint(msg);
//   }
// }
