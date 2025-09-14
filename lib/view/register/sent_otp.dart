import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  String? _verificationId;
  bool _otpSent = false;
  String? _statusMessage;

  /// Step 1: Send OTP
  Future<void> _sendOTP() async {
  try {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+855${_phoneController.text.trim()}",
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto verification on some devices
        await _auth.signInWithCredential(credential);
        setState(() {
          _statusMessage = "Phone number automatically verified!";
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          _statusMessage = "Verification failed: ${e.message}";
        });
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId; // IMPORTANT
          _otpSent = true;                  // Show OTP field
          _statusMessage = "OTP sent! Check your phone.";
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  } catch (e) {
    setState(() {
      _statusMessage = "Error sending OTP: $e";
    });
  }
}
  /// Step 2: Verify OTP
  Future<void> _verifyOTP() async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId ?? "",
        smsCode: _otpController.text.trim(),
      );

      final userCredential = await _auth.signInWithCredential(credential);

      setState(() {
        _statusMessage =
            "Logged in as ${userCredential.user?.phoneNumber ?? "Unknown"}";
      });
    } catch (e) {
      setState(() {
        _statusMessage = "Invalid OTP: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Phone Auth")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (!_otpSent) ...[
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  hintText: "Enter number without +855",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _sendOTP,
                child: const Text("Send OTP"),
              ),
            ] else ...[
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter OTP",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _verifyOTP,
                child: const Text("Verify OTP"),
              ),
            ],
            if (_statusMessage != null) ...[
              const SizedBox(height: 20),
              Text(
                _statusMessage!,
                style: TextStyle(
                  fontSize: 16,
                  color: _statusMessage!.startsWith("✅")
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
