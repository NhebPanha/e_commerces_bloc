import 'package:e_com_bloc/view/register/otp/firebaseAAuthentication.dart';
import 'package:flutter/material.dart';

class SentOtp extends StatefulWidget {
  const SentOtp({super.key});

  @override
  State<SentOtp> createState() => _SentOtpState();
}

class _SentOtpState extends State<SentOtp> {
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController otp = TextEditingController();
  bool canshow = false;
  final Firebaseaauthentication authHelper = Firebaseaauthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Phone Auth")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextField("Phone", phoneNumber, Icons.phone),
            const SizedBox(height: 16),
            if (canshow) buildTextField("OTP", otp, Icons.timer),
            const SizedBox(height: 20),
            !canshow
                ? ElevatedButton(
                    onPressed: () async {
                      await authHelper.sendOTP(phoneNumber.text);
                      setState(() => canshow = true);
                    },
                    child: const Text("Send OTP"),
                  )
                : ElevatedButton(
                    onPressed: () async {
                      await authHelper.authenticateMe(otp.text);
                    },
                    child: const Text("Submit OTP"),
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
