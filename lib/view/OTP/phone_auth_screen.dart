import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  String? _verificationId;
  bool _codeSent = false;
  bool _loading = false;
  final auth = FirebaseAuth.instance;

  Future<void> sendCode() async {
    setState(() => _loading = true);
    final phone = _phoneController.text.trim();
    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto sign-in on some devices
        await auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Auto-signed in')));
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() => _loading = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Verification failed: ${e.message}')));
      },
      codeSent: (verificationId, forceResendingToken) {
        setState(() {
          _verificationId = verificationId;
          _codeSent = true;
          _loading = false;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  Future<void> verifyCode() async {
    final code = _codeController.text.trim();
    if (_verificationId == null) return;
    final cred = PhoneAuthProvider.credential(verificationId: _verificationId!, smsCode: code);
    try {
      await auth.signInWithCredential(cred);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signed in')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign in error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone OTP')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _phoneController, decoration: InputDecoration(labelText: '+855 ...')),
            SizedBox(height: 12),
            _codeSent
              ? Column(children: [
                  TextField(controller: _codeController, decoration: InputDecoration(labelText: 'Enter OTP')),
                  SizedBox(height: 8),
                  ElevatedButton(onPressed: verifyCode, child: Text('Verify')),
                ])
              : ElevatedButton(onPressed: sendCode, child: _loading ? CircularProgressIndicator() : Text('Send OTP')),
          ],
        ),
      ),
    );
  }
}
