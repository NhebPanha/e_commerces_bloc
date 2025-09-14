import 'package:e_com_bloc/components/button_next_page.dart';
import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/utils/verify_code.dart';
import 'package:e_com_bloc/view/register/complete_profile.dart';
import 'package:e_com_bloc/view/register/new_password.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pinput.dart';

class VerifyCodePage extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const VerifyCodePage({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _pinController = TextEditingController();
  String? _statusMessage;
  Future<void> _verifyOTP() async {
  try {
    // Create credential from OTP
    final credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: _pinController.text.trim(),
    );

    final userCredential = await _auth.signInWithCredential(credential);

    setState(() {
      _statusMessage =
          "Logged in as ${userCredential.user?.phoneNumber ?? "Unknown"}";
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompleteProfile(), 
      ),
    );
  } catch (e) {
    setState(() {
      _statusMessage = "Invalid OTP: $e";
    });
  }
}


  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(fontSize: 20, color: Colors.black),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Enter the code sent to ${widget.phoneNumber}"),
                const SizedBox(height: 20),
                Pinput(
                  length: 6,
                  controller: _pinController,
                  defaultPinTheme: defaultPinTheme,
                ),
                const SizedBox(height: 20),
                Container(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _verifyOTP,
                    child: const Text("Verify",style: TextStyle(fontSize: 18),),
                  ),
                ),
                if (_statusMessage != null) ...[
                  const SizedBox(height: 20),
                  Text(
                    _statusMessage!,
                    style: TextStyle(
                      color: _statusMessage!.startsWith("") ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Container(child: Row(children: [verify_code()])),
          SizedBox(height: 30),
          Text(
            " Doesn't receive OTP?",
            style: TextStyle(fontSize: AppSize.s13, color: AppColorsPath.grey),
          ),
          Text(
            "Resend new code.",
            style: TextStyle(
              fontSize: AppSize.s12,
              color: AppColorsPath.fromARGB,
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPassword()));
            },
            child: Row(children: [Button_Next_Page(txt: "Verify", onClick: () {  },)])),
        ],
      ),
    );
  }
}

