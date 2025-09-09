import 'package:e_com_bloc/components/button_next_page.dart';
import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/utils/text_input_field.dart';
import 'package:e_com_bloc/view/register/sign_in.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            // color: Colors.amber,
            margin: EdgeInsets.only(left: 80, top: 80, right: 80),
            width: 230,
            child: Column(
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: AppSize.s25,
                    color: AppColorsPath.black,
                  ),
                ),
                Text(
                  "   is the process by which a new \n     user registers on a platform.",
                  style: TextStyle(
                    fontSize: AppSize.s12,
                    color: AppColorsPath.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      "User Name",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: AppSize.s16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          TextInputField(icons: Icons.person_outline, txt: "Your name"),
          SizedBox(height: 10),
          // Password Label
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: AppSize.s16,
                  ),
                ),
              ],
            ),
          ),
          const TextInputField(icons: Icons.email_outlined, txt: "Email"),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "Password",
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
            txt: "Password",
            isPassword: true,
          ),
          Container(
            margin: EdgeInsets.only(left: 4),
            child: Row(
              children: [
                Checkbox(
                  value: isChecked, // current value
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false; // update value
                    });
                  },
                ),
                const Text("Agree with Terms & Conditions"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Sign In Button
          SizedBox(
            width: double.infinity,
            child: Button_Next_Page(txt: "Sign Up"),
          ),

          const SizedBox(height: 20),
          // Login With section
          GestureDetector(
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
              },
            child: Login_With(txt: "Sign in")),
        ],
      ),
    );
  }
}
