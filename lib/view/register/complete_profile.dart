import 'package:e_com_bloc/components/button_next_page.dart';
import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/utils/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 65, top: 8, right: 55),
            child: Column(
              children: [
                Text(
                  "Complete Your Profile",
                  style: TextStyle(
                    fontSize: AppSize.s25,
                    color: AppColorsPath.black,
                  ),
                ),
                Text(
                  "is a process where a user adds missing",
                  style: TextStyle(
                    fontSize: AppSize.s13,
                    color: AppColorsPath.grey,
                  ),
                ),
                Text(
                  "personal or account information after signing up",
                  style: TextStyle(
                    fontSize: AppSize.s12,
                    color: AppColorsPath.fromARGB,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: 90,
            height: 90,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColorsPath.grey.withOpacity(0.1),
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: const Color.fromARGB(210, 128, 128, 128),
                  ),
                ),
                Positioned(
                  right: 5,
                  //top: 100,
                  bottom: 0,
                  child: CircleAvatar(
                   child: Icon(Icons.edit,size: 15,color: AppColorsPath.white,),
                    radius: 11,
                    backgroundColor: const Color.fromARGB(198, 135, 15, 55),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: AppSize.s16,
                  ),
                ),
              ],
            ),
          ),
          const TextInputField(icons: Icons.person, txt: "Millie Millie"),
          SizedBox(height: 10,),
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
          const TextInputField(icons: Icons.email_outlined, txt: "Mille0678@gmail.com"),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "Genter",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: AppSize.s16,
                  ),
                ),
              ],
            ),
          ),
          const TextInputField(icons: Icons.person, txt: "Femail"),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: Button_Next_Page(txt: "Complete Profile"),
          ),
        ],
      ),
    );
  }
}
