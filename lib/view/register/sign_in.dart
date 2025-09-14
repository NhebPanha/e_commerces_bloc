import 'package:e_com_bloc/components/button_next_page.dart';
import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/utils/text_input_field.dart';
import 'package:e_com_bloc/view/register/complete_profile.dart';
import 'package:e_com_bloc/view/register/forgot_password.dart';
import 'package:e_com_bloc/view/register/sign_up.dart';
import 'package:e_com_bloc/view/register/verify_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscurePassword = true;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormFieldState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  Future<void> _login() async {
    setState(() => _errorMessage = null);
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login successful!")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CompleteProfile()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() => _errorMessage = "No account fount for this email.");
      } else if (e.code == 'worng-password') {
        setState(() => _errorMessage = "Wrong password. Try again.");
      } else if (e.code == "Invalid-email") {
        setState(() => _errorMessage = "Invalid-email format");
      } else {
        setState(() => _errorMessage = e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Text("Sign In", style: TextStyle(fontSize: AppSize.s25)),
                    const SizedBox(height: 4),
                    const Text("Please enter your credentials using our app"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 350,
                    height: 50,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: AppColorsPath.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(children: [Text("Password", style: TextStyle(fontSize: 20))]),
              const SizedBox(height: 10),
              Container(
                width: 350,
                height: 50,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword, // hide/show
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
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
              ),
              const SizedBox(height: 10),
              // Forgot Password
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()),
                  );
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: AppSize.s15),
                  ),
                ),
              ),

              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.only(left: 25, right: 15),
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(223, 135, 15, 55),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _login,
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: AppSize.s18),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Login_With(txt: "Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
