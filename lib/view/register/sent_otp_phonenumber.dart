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
  String _selectedCode = "+855";
  String? _statusMessage;

  Future<void> _sendOTP() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "$_selectedCode${_phoneController.text.trim()}",
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
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _statusMessage = "OTP sent! Check your phone.";
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyCodePage(
                verificationId: verificationId,
                phoneNumber: "$_selectedCode${_phoneController.text.trim()}",
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // optional
        },
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
            Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: 300,
              height: 300,
              child: Image(
                image: NetworkImage(
                  "https://i.pinimg.com/1200x/5a/5e/36/5a5e369e01252707f7ecc68e201e76d9.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
                      items: const [
                        DropdownMenuItem(value: "+855", child: Text("🇰🇭 +855")),
                        DropdownMenuItem(value: "+1", child: Text("🇺🇸 +1")),
                        DropdownMenuItem(value: "+1", child: Text("🇨🇦 +1")),
                      ],
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
            Container(
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
                  color: _statusMessage!.startsWith("") ? Colors.green : Colors.red,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
