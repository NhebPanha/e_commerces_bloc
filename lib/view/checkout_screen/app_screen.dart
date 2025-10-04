import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  final String title;
  final IconData icons;
  final Color? color;
  const AppScreen({
    super.key,
    required this.title,
    required this.icons,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      leading: IconButton(onPressed: () {}, icon: Icon(icons)),
    );
  }
}
