import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/utils/text_input_field.dart';
import 'package:e_com_bloc/view/register/complete_profile.dart';


class NewPassword extends StatefulWidget {
  const NewPassword({super.key, required String email, required String verificationId});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}
class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _createNewPassword() async {
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Use Firebase password reset after OTP verification
      // Since user verified OTP, we can send password reset link or update via temporary credential
      await FirebaseAuth.instance.currentUser?.updatePassword(password);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password updated successfully")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CompleteProfile()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.code} - ${e.message}")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 80, top: 8, right: 80),
            child: Column(
              children: [
                Text(
                  "New Password",
                  style: TextStyle(
                    fontSize: AppSize.s25,
                    color: AppColorsPath.black,
                  ),
                ),
                Text(
                  "  updated password that a user",
                  style: TextStyle(
                    fontSize: AppSize.s13,
                    color: AppColorsPath.grey,
                  ),
                ),
                Text(
                  "    creates when they want to change",
                  style: TextStyle(
                    fontSize: AppSize.s12,
                    color: AppColorsPath.fromARGB,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
            // Email Label
            Container(
            margin: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: AppSize.s16,
                  ),
                ),
              ],
            ),
          ),
           const TextInputField(
              icons: Icons.lock_outline,
              txt: "Password",
              isPassword: true,
            ),
            const SizedBox(height: 10),
            // Password Label
             Container(
            margin: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "Confirm Password",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: AppSize.s16,
                  ),
                ),
              ],
            ),
          ),
            const TextInputField(
              icons: Icons.lock_outline,
              txt: "Confirm Password",
              isPassword: true,
            ),

          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CompleteProfile()));
            },
            // child: Row(children: [Button_Next_Page(txt: "Create New Password")])
            ),
        ],
      ),
    );
  }
}
