import 'package:e_com_bloc/utils/app_bar_screen.dart';
import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_label.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/utils/bottom_button.dart';
import 'package:e_com_bloc/view/checkout_screen/shipping/shipping_address_data.dart';
import 'package:flutter/material.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  List<Map<String, dynamic>> option = shippingAddress;

  /// Keep track of the selected radio button
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsPath.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarScreen(
          icons: const Icon(Icons.arrow_back),
          text: "Shipping Address",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
          itemCount: option.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    Text(
                      option[index]['title'],
                      style: TextStyle(
                        fontSize: AppSize.s16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Text(option[index]['address'], maxLines: 2),
                      ),
                      Radio<int>(
                        value: index, // each radio button’s value is its index
                        groupValue: _selectedIndex, // selected index
                        onChanged: (newIndex) {
                          setState(() {
                            _selectedIndex = newIndex; // update selected
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Divider(
                  color: Color.fromARGB(255, 224, 220, 220),
                  height: 2,
                  thickness: 1,
                ),
              ],
            );
          },
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          bottom: 30,
          top: 10,
          left: 20,
          right: 20,
        ),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: BottomButton(
            onTap: () {
              if (_selectedIndex != null) {
                print("Selected address: ${option[_selectedIndex!]}");
              } else {
                print("No address selected");
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text("No Address selected"),
                //     backgroundColor: AppColorsPath.red,
                //     behavior: SnackBarBehavior.floating,
                //     duration: Duration(seconds: 1),
                //     margin: EdgeInsets.only(top: 20),
                //   ),
                // );
              }
            },
            text: "Apply",
          ),
        ),
      ),
    );
  }
}
