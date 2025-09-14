import 'package:e_com_bloc/components/button_next_page.dart';
import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_label.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/utils/config_routs.dart';
import 'package:e_com_bloc/view/register/complete_profile.dart';
import 'package:e_com_bloc/view/register/sent_otp_phonenumber.dart';
import 'package:e_com_bloc/view/register/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    AppLabel(text: "", size: 10),
                    AppLabel(text: "Sign In", size: AppSize.s25),
                    const SizedBox(height: 4),
                    const AppLabel(text: "Please enter your credentials using our app",size: AppSize.s16,textAlign: TextAlign.center,),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(children: [AppLabel(text: "Enter Email", size: AppSize.s19)]),
              SizedBox(height: 10,),
              Container(
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
              Row(children: [AppLabel(text: "Password", size: AppSize.s19)]),
               SizedBox(height: 10),
              Container(
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
                    MaterialPageRoute(builder: (context) => SentOtpPhonenumber()),
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
              ButtomNextPage(txt: "Login",onClick: _login),
              const SizedBox(height: 50),

              LoginWithWidget(txt: "Sign Up",onClick: (){
                ConfigRouter.push(context, SignUp());
              },),
            ],
          ),
        ),
      ),
    );
  }
}

