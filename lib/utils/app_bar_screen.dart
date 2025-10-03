import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:flutter/material.dart';

class AppBarScreen extends StatelessWidget {
  final Icon icons;
  final String text;
  const AppBarScreen({super.key, required this.icons, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        backgroundColor: AppColorsPath.white,
        leading: icons,
        title: Text(
          text,
          style: TextStyle(
            fontSize: AppSize.s20,
            fontWeight: FontWeight.bold,
            // fontFamily: "funnel",
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
