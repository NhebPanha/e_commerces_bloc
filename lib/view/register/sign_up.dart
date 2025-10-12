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
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _errorMessage = null);
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      await _auth.currentUser?.updateDisplayName(
        _usernameController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("SignUp successful!")),
      );
      ConfigRouter.push(context, SignInScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() => _errorMessage = "This email is already registered.");
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
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 70),
                        const AppLabel(
                          text: "Create Account",
                          size: AppSize.s25,
                        ),
                        const SizedBox(height: 5),
                        const AppLabel(
                          text: "Fill your information below or register with your social account",
                          size: AppSize.s15,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),

                        // Username field
                        Row(children: const [AppLabel(text: "Username", size: AppSize.s18)]),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: _usernameController,
                            validator: (value) => value!.isEmpty ? "Enter username" : null,
                            decoration: InputDecoration(
                              hintText: "Enter Username",
                              prefixIcon: const Icon(Icons.person_outlined, color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Email field
                        Row(children: const [AppLabel(text: "Email", size: AppSize.s18)]),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: _emailController,
                            validator: (value) => value!.isEmpty ? "Enter email" : null,
                            decoration: InputDecoration(
                              hintText: "Enter Email",
                              prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Password field
                        Row(children: const [AppLabel(text: "Password", size: AppSize.s18)]),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            validator: (value) => value!.isEmpty ? "Enter password" : null,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() => _obscurePassword = !_obscurePassword);
                                },
                              ),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Sign up button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColorsPath.fromARGB,
                              foregroundColor: AppColorsPath.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: _signUp,
                            child: const AppLabel(
                              text: "Sign Up",
                              size: AppSize.s18,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        if (_errorMessage != null) ...[
                          const SizedBox(height: 10),
                          Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
                        ],
                        SizedBox(height: 50),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignInScreen()),
                          );
                          },
                          child: LoginWithWidget(
                            txt: "Already have an account?  Log In",
                            textColor: AppColorsPath.grey,
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
