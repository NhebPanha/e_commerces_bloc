import 'package:flutter/widgets.dart';

final class AppLabel extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final String? fontFamily;

 const AppLabel({
    required this.text,
    required this.size,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.fontFamily,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
        fontFamily: fontFamily,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
