import 'package:e_com_bloc/components/button_next_page.dart';
import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/utils/verify_code.dart';
import 'package:e_com_bloc/view/register/new_password.dart';
import 'package:flutter/material.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
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
                  "Verify Code",
                  style: TextStyle(
                    fontSize: AppSize.s25,
                    color: AppColorsPath.black,
                  ),
                ),
                Text(
                  "   Server generates a random numeric",
                  style: TextStyle(
                    fontSize: AppSize.s13,
                    color: AppColorsPath.grey,
                  ),
                ),
                Text(
                  "or alphanumeric code",
                  style: TextStyle(
                    fontSize: AppSize.s12,
                    color: AppColorsPath.fromARGB,
                  ),
                ),
              ],
            ),
          ),
          Container(child: Row(children: [verify_code()])),
          SizedBox(height: 30),
          Text(
            " Doesn't receive OTP?",
            style: TextStyle(fontSize: AppSize.s13, color: AppColorsPath.grey),
          ),
          Text(
            "Resend new code.",
            style: TextStyle(
              fontSize: AppSize.s12,
              color: AppColorsPath.fromARGB,
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPassword()));
            },
            child: Row(children: [Button_Next_Page(txt: "Verify")])),
        ],
      ),
    );
  }
}
