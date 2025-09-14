import 'package:flutter/material.dart';
class CustomSearchWidget extends StatelessWidget {
  final String title;
  final IconData icons;
  const CustomSearchWidget({super.key, required this.title, required this.icons});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: title,
              prefixIcon: Icon(icons),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
      ],
    );
  }
}