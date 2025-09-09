import 'package:e_com_bloc/components/button_next_page.dart';
import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/utils/text_input_field.dart';
import 'package:e_com_bloc/utils/verify_code.dart';
import 'package:e_com_bloc/view/register/complete_profile.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
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
            child: Row(children: [Button_Next_Page(txt: "Create New Password")])),
        ],
      ),
    );
  }
}
