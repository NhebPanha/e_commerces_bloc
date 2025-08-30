import 'package:flutter/cupertino.dart';

class CustomWidgetGetStart extends StatelessWidget{
  final String image; 
  final double height;
  final double width;
  final Color color;
  final BorderRadius? borderRadius;
  final BoxFit? boxFit;
  final BoxShadow? boxShadow;

  const CustomWidgetGetStart({
    required this.image,
    required this.height,
    required this.width,
    required this.color,
    this.borderRadius,
    this.boxFit,
    this.boxShadow,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        boxShadow: boxShadow != null ? [boxShadow!] : null,
        image: DecorationImage(
          image: AssetImage(image),
          fit: boxFit ?? BoxFit.cover,
        ),
      ),
    );
  }
}