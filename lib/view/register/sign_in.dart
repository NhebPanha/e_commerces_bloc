import 'package:e_com_bloc/components/button_next_page.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/utils/text_input_field.dart';
import 'package:e_com_bloc/view/register/sign_up.dart';
import 'package:e_com_bloc/view/register/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: AppSize.s25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text("Please enter your credentials using our app"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Email Label
            Text(
              "Email",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppSize.s20,
              ),
            ),
            const TextInputField(icons: Icons.email_outlined, txt: "Email"),

            const SizedBox(height: 20),
            // Password Label
            Text(
              "Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppSize.s20,
              ),
            ),
            const TextInputField(
              icons: Icons.lock_outline,
              txt: "Password",
              isPassword: true,
            ),

            const SizedBox(height: 10),
            // Forgot Password
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyCode()));
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: AppSize.s15),
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: Button_Next_Page(txt: "Sign In"),
            ),

            const SizedBox(height: 20),
            // Login With section
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Login_With(txt: "Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
