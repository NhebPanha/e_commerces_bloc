import 'package:e_com_bloc/components/button_next_page.dart';
import 'package:e_com_bloc/components/app_colors_path.dart';
import 'package:e_com_bloc/components/app_label.dart';
import 'package:e_com_bloc/components/app_size.dart';
import 'package:e_com_bloc/components/config_file_path/config_routs.dart';
import 'package:e_com_bloc/view/register/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  bool _obscurePassword = true;
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;
  bool isChecked = false;

  Future<void> _signUp() async {
    setState(() => _errorMessage = null);
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      await _auth.currentUser?.updateDisplayName(
        _usernameController.text.trim(),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("SignUp successful!")));
      ConfigRouter.push(context, SignInScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() => _errorMessage = "This email is already registered.");
      } else if (e.code == 'weak-password') {
        setState(() => _errorMessage = "Password is too weak.");
      } else if (e.code == 'weak-password') {
        setState(() => _errorMessage = "Password is too weak.");
      } else if (e.code == 'invalid-email') {
        setState(() => _errorMessage = "Invalid email format.");
      } else {
        setState(() => _errorMessage = e.message);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, right: 20, left: 20),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        AppLabel(
                          text: "Create Account",
                          size: AppSize.s25,
                          color: AppColorsPath.black,
                        ),
                        AppLabel(
                          text: "fill your information below or register",
                          size: AppSize.s15,
                          color: AppColorsPath.black,
                        ),
                        AppLabel(
                          text: "with your social account",
                          size: AppSize.s15,
                          color: AppColorsPath.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          AppLabel(text: "Username", size: AppSize.s18),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            hintText: "Enter Username",
                            prefixIcon: Icon(
                              Icons.person_outlined,
                              color: AppColorsPath.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [AppLabel(text: "Email", size: AppSize.s18)],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
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
                      SizedBox(height: 10),
                      Row(
                        children: [
                          AppLabel(text: "Password", size: AppSize.s18),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
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
                    ],
                  ),
                ),
                
                
                SizedBox(height: 30),
                Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:AppColorsPath.fromARGB,
                      foregroundColor: AppColorsPath.white,
                    ),
                    onPressed: _signUp,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0,vertical: 5),
                      child: AppLabel(text:
                        "Sign Up",
                       size: AppSize.s18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  // child: Login_With(txt: "Login",textColor: AppColorsPath.fromARGB,),
                ),
              ],
              //]
            ),
          ),
        ),
      ),
    );
  }
}
