import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_label.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:flutter/material.dart';

class CheckoutList extends StatelessWidget {
  final Icon icons;
  final String title;
  final String text;
  final String subtitle;
  final VoidCallback change;
  const CheckoutList({
    super.key,
    required this.icons,
    required this.text,
    required this.subtitle,
    required this.change,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              AppLabel(text: title, size: 18, fontWeight: FontWeight.bold),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                icons,
                Text(
                  text,
                  style: TextStyle(
                    fontSize: AppSize.s16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 250,
                  child: AppLabel(text: subtitle, size: 15, maxLines: 2),
                ),
                InkWell(
                  focusColor: AppColorsPath.dard,
                  borderRadius: BorderRadius.circular(10),
                  highlightColor: AppColorsPath.grey,
                  onTap: change,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Change",
                        style: TextStyle(
                          color: AppColorsPath.fromARGB,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          const Divider(
            color: Color.fromARGB(
              255,
              224,
              220,
              220,
            ), // Customize the color of the divider
            height: 2, // Total height of the divider, including padding
            thickness: 1, // Actual thickness of the line
            // indent: 20, // Indent from the start edge
            // endIndent: 16, // Indent from the end edge
          ),
        ],
      ),
    );
  }
}
