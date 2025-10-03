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
  bool _isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsPath.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarScreen(
          icons: Icon(Icons.arrow_back),
          text: "Shipping Adddress",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
          itemCount: shippingAddress.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.location_on_outlined),
                    ),
                    Text(
                      "${shippingAddress[index]['title']}",
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
                      Container(
                        width: 250,
                        child: Text(
                          "${shippingAddress[index]['address']}",
                          maxLines: 2,
                        ),
                      ),
                      Transform.scale(
                        scale: 1.2, // 1.0 = default size, 2.0 = double size
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          value: _isCheck,
                          onChanged: (newvalue) {
                            setState(() {
                              _isCheck = newvalue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                const Divider(
                  color: Color.fromARGB(255,224,220,220,
                  ), // Customize the color of the divider
                  height: 2, // Total height of the divider, including padding
                  thickness: 1, // Actual thickness of the line
                ),
              ],
            );
          },
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 30,top: 10,left: 20,right: 20,),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: BottomButton(
            onTap: () {},
            text: "Apply",
            // height: 5, width: 150
          ),
        ),
      ),
    );
  }
}
