import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {
  final IconData iconin;
  final String text;
  const AppBarWidget({super.key, required this.iconin, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60,left: 25,bottom: 20),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColorsPath.white,
              border: Border.all(color: const Color.fromARGB(255, 47, 34, 34) ,),
            ),
            child: IconButton(onPressed: () {}, icon: Icon(iconin)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.s20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
