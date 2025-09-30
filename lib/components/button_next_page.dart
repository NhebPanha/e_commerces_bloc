import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_label.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtomNextPage extends StatelessWidget {
  final String txt;
  final Function()? onClick;
  ButtomNextPage({super.key, required this.txt, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 12, top: 20, right: 10),
          width: 350,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(223, 135, 15, 55),
          ),
          child: Center(
            child: Text(
              txt,
              style: TextStyle(
                fontSize: AppSize.s20,
                color: AppColorsPath.white,
              ),
            ),
          ),
        ),
        // Login with Google and FB, And IG
        SizedBox(height: 20),
        Container(),
      ],
    );
  }
}

class LoginWithWidget extends StatelessWidget {
  late final String txt;
  late final Color textColor;
   LoginWithWidget({super.key, required this.txt, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 20),
      width: 340,
      //height: 20,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Divider(thickness: 1, color: Colors.grey, indent: 20),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: AppLabel(text: "Or log in with", size: AppSize.s12),
              ),
              Expanded(
                child: Divider(thickness: 1, color: Colors.grey, indent: 1),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey, width: 1),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://i.pinimg.com/1200x/10/4d/91/104d91f71da1b56e29231059d85a1e93.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            //border: Border.all(color: Colors.grey, width: 1),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://i.pinimg.com/736x/1e/0f/37/1e0f37ff0a7161dbebf7550685b8b668.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            //color: Colors.black,
                            // border: Border.all(color: Colors.grey, width: 1),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://i.pinimg.com/736x/0d/88/8a/0d888aecd94f752e9749830779ba2580.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 45),
            child: Row(
              children: [
                Text(
                  "Don't have an accoutnt?",
                  style: TextStyle(fontSize: AppSize.s16),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  // onDoubleTap: ,
                  child: AppLabel(
                    text: txt,
                    size: AppSize.s16,
                    color: AppColorsPath.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
