import 'package:e_com_bloc/view/register/sent_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController mobileTextEditController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();
  String? verficationId1='';
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Verify Code Screen')));
  }

  Future<void> setOTP() async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: "+855 ${mobileTextEditController.text}",
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await auth.signInWithCredential(phoneAuthCredential);
          Get.showSnackbar(
            const GetSnackBar(message: "Phone number automatically verified"),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print("The provided number is not valid");
          }
        },
        codeSent: (verificationId, forceResendingToken) {
          verficationId1 = verificationId;
          Get.to(() => PhoneAuthScreen());
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('Auto retrieval timeout');
        },
      );
    } catch (e) {
      print("error doing sent OTP--->$e");
    }
  }

  Future<void> verifyOTP() async {
    final PhoneAuthCredential credentail = PhoneAuthProvider.credential(
      verificationId: verficationId1 ?? "",
      smsCode: otpController.text,
    );
    UserCredential userCredential = await auth.signInWithCredential(credentail);
    Get.showSnackbar(
      GetSnackBar(message: "User successfully sign up phone number"),
    );
    user = userCredential.user;
  }
}
