import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_label.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:flutter/material.dart';

class CheckoutList extends StatelessWidget {
  final Icon icons;
  final String text;
  final String subtitle;
  final VoidCallback  change;
  const CheckoutList({
    super.key,
    required this.icons,
    required this.text,
    required this.subtitle, required this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              AppLabel(
                text: "Shopping Address",
                size: 20,
                fontWeight: FontWeight.bold,
              ),
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
                    fontSize: AppSize.s20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLabel(text: subtitle, size: 15, maxLines: 2),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColorsPath.white, // Background color of the button
                    foregroundColor:
                        AppColorsPath.fromARGB, // Text and icon color
                    // elevation: 8.0, // Shadow elevation
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(
                    //     5.0,
                    //   ), // Rounded corners
                    // ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ), // Padding
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ), // Text style
                  ),
                  onPressed: change,
                  child: Text("change"),
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
