import 'package:e_com_bloc/view/register/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SentOtpPhonenumber extends StatefulWidget {
  const SentOtpPhonenumber({super.key});

  @override
  State<SentOtpPhonenumber> createState() => _SentOtpPhonenumberState();
}

class _SentOtpPhonenumberState extends State<SentOtpPhonenumber> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();

  // Default country code
  String _selectedCode = "+855";
  String? _statusMessage;

  // Map of countries for dropdown
  final Map<String, String> countries = {
    "+855": "🇰🇭 Cambodia",
    "+1": "🇺🇸 USA",
    "+44": "🇬🇧 UK",
  };

  /// Send OTP function
  Future<void> _sendOTP() async {
    final phone = _phoneController.text.trim();

    if (phone.isEmpty) {
      setState(() {
        _statusMessage = "Please enter your phone number!";
      });
      return;
    }

    final fullPhoneNumber = "$_selectedCode$phone";

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: fullPhoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          setState(() {
            _statusMessage = "Phone number automatically verified!";
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            _statusMessage = "Verification failed: ${e.message}";
          });
          print("FirebaseAuthException code: ${e.code}");
          print("FirebaseAuthException message: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _statusMessage = "OTP sent! Check your phone.";
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => VerifyCodePage(
                    verificationId: verificationId,
                    phoneNumber: fullPhoneNumber,
                  ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      setState(() {
        _statusMessage = "Error sending OTP: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Send OTP"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              child: Image.network(
                "https://i.pinimg.com/1200x/5a/5e/36/5a5e369e01252707f7ecc68e201e76d9.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedCode,
                      items:
                          countries.entries
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.key,
                                  child: Text("${e.value} ${e.key}"),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCode = value!;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 180,
              child: ElevatedButton(
                onPressed: _sendOTP,
                child: const Text("Send OTP", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ),
            if (_statusMessage != null) ...[
              const SizedBox(height: 20),
              Text(
                _statusMessage!,
                style: TextStyle(
                  color:
                      _statusMessage!.startsWith("OTP sent")
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
