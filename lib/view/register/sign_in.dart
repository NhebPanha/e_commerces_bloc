
import 'package:e_com_bloc/components/app_colors_path.dart';
import 'package:e_com_bloc/components/app_label.dart';
import 'package:e_com_bloc/components/app_size.dart';
import 'package:e_com_bloc/components/config_file_path/config_routs.dart';
import 'package:e_com_bloc/view/register/complete_profile.dart';
import 'package:e_com_bloc/view/register/sent_otp_phonenumber.dart';
import 'package:e_com_bloc/view/register/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignInScreen> {
  bool _obscurePassword = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _errorMessage = null);
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login successful!")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CompleteProfile()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() => _errorMessage = "No account found for this email.");
      } else if (e.code == 'wrong-password') {
        setState(() => _errorMessage = "Wrong password. Try again.");
      } else if (e.code == "invalid-email") {
        setState(() => _errorMessage = "Invalid email format.");
      } else {
        setState(() => _errorMessage = e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const AppLabel(text: "Sign In", size: AppSize.s25),
              const SizedBox(height: 4),
              const AppLabel(
                text: "Hi! Welcome back, you've been missed",
                size: AppSize.s16,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Email field
              Row(
                children: [
                  AppLabel(text: "Enter Email", size: AppSize.s19),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                validator: (value) =>
                    value!.isEmpty ? "Please enter your email" : null,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Password field
              Row(
                children: [
                  AppLabel(text: "Password", size: AppSize.s19),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                validator: (value) =>
                    value!.isEmpty ? "Please enter your password" : null,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    ConfigRouter.push(context, const SentOtpPhonenumber());
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: AppSize.s15,
                      color: AppColorsPath.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Login button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(223, 135, 15, 55), // main color
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: _login,
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: AppSize.s18),
                  ),
                ),
              ),

              if (_errorMessage != null) ...[
                const SizedBox(height: 10),
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ],

              const SizedBox(height: 30),

              // Sign up link
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                // child: Login_With(txt: "Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}