import 'package:e_com_bloc/utils/app_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class ButtomGetStartWidget extends StatelessWidget{
  final String title;
  final double?size;
  final FontWeight? fontWeight;
  final String ?fonts;
  final Color? colors;
  final double? radius;
  final Border? border;
  final Function()? onClick;
  ButtomGetStartWidget({
    required this.title,
    this.size,
    this.fontWeight,
    this.fonts,
    this.colors,
    this.radius,
    this.border,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: colors,
          border: border,
          borderRadius: BorderRadius.circular(radius!),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
          child: AppLabel(
            text: title, size: size!,fontWeight: fontWeight,fontFamily: fonts
          ,),
        ),
      ),
    );
  }

}