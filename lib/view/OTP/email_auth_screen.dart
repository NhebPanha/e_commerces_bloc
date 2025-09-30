// email_link_auth.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class EmailLinkAuthScreen extends StatefulWidget {
  @override
  _EmailLinkAuthScreenState createState() => _EmailLinkAuthScreenState();
}
class _EmailLinkAuthScreenState extends State<EmailLinkAuthScreen> {
  final _emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool _sent = false;

  Future<void> sendSignInLink() async {
    final email = _emailController.text.trim();
    final actionCodeSettings = ActionCodeSettings(
      url: 'https://yourapp.example.com/finishSignIn', // must be whitelisted in Firebase console
      handleCodeInApp: true,
      iOSBundleId: 'com.yourcompany.yourapp',

      androidPackageName: 'com.yourcompany.yourapp',
      androidInstallApp: true,
      androidMinimumVersion: '12',
    );

    await auth.sendSignInLinkToEmail(email: email, actionCodeSettings: actionCodeSettings);
    // Save email locally so you can complete sign-in after redirect
    // e.g., using flutter_secure_storage or SharedPreferences
    setState(() => _sent = true);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email link sent to $email')));
  }

  // You must handle incoming dynamic links in app entry & complete sign-in
  // Example handler should be wired in main() with FirebaseDynamicLinks.onLink or getInitialLink
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Email Link (Passwordless)')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
          SizedBox(height: 12),
          ElevatedButton(onPressed: sendSignInLink, child: Text('Send Sign-in Link')),
          if (_sent) Text('Check your email, then open the link to complete sign-in.')
        ]),
      ),
    );
  }
}
