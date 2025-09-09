
import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:flutter/material.dart';

class verify_code extends StatelessWidget {
  const verify_code({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 70, top: 30),
                width: 40,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColorsPath.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, top: 30),
                width: 40,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColorsPath.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, top: 30),
                width: 40,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColorsPath.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, top: 30),
                width: 40,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColorsPath.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
