import 'package:e_com_bloc/components/app_colors_path.dart';
import 'package:e_com_bloc/components/app_icon_path.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  // final double height;
  // final double width;
  final VoidCallback onTap;
  final String text;
  const BottomButton({
    super.key,
    required this.text, required this.onTap,
    // required this.height, required this.width
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: AppColorsPath.white, // text color
        backgroundColor: AppColorsPath.dard, // button background
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // rounded corners
        ),
      ),
      onPressed: onTap,
      child: Text(text),
    );
  }
}
