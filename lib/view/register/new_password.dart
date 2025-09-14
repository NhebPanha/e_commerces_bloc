import 'package:e_com_bloc/components/button_next_page.dart';
import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_label.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/utils/text_input_field.dart';
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
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            AppLabel(
              text: "New Password",
              size: AppSize.s25,
              color: AppColorsPath.black,
            ),
            AppLabel(
              text: "updated password that a user",
              size: AppSize.s13,
              color: AppColorsPath.grey,
            ),
            AppLabel(
              text: "    creates when they want to change",
              size: AppSize.s12,
              color: AppColorsPath.fromARGB,
            ),
            const SizedBox(height: 20),
            // Email Label
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  AppLabel(text: "Password", size: AppSize.s16),
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
                  AppLabel(text: 
                    "Confirm Password",
                      //fontWeight: FontWeight.bold,
                      size: AppSize.s16,
                  ),
                ],
              ),
            ),
            TextInputField(
              icons: Icons.lock_outline,
              txt: "Confirm Password",
              isPassword: true,
            ),

            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompleteProfile()),
                );
              },
              child: Row(
                children: [Button_Next_Page(txt: "Create New Password",onClick: (){},)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
