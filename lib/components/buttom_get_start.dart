// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import 'package:e_com_bloc/utils/app_label.dart';

class ButtomGetStart extends StatelessWidget {
  final String title;
  final double h;
  final double w;
  final Color? colors;
  final BorderRadius? raduis;
  final double? size;
  ButtomGetStart({
  required this.title, required this.h, required this.w, this.colors, this.raduis, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,height: h,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: raduis ?? BorderRadius.circular(8),
      ),
      child: AppLabel(text: title, size: size!),
    );
  }
}
