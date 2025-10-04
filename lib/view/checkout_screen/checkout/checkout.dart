import 'package:e_com_bloc/components/app_bar_screen.dart';
import 'package:e_com_bloc/components/app_colors_path.dart';
import 'package:e_com_bloc/components/app_label.dart';
import 'package:e_com_bloc/components/app_size.dart';
import 'package:e_com_bloc/components/bottom_button.dart';
import 'package:e_com_bloc/view/checkout_screen/checkout/checkout_list.dart';
import 'package:e_com_bloc/view/checkout_screen/checkout/order_list.dart';
// import 'package:e_com_bloc/utils/text_input_field.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsPath.white,
      appBar: PreferredSize(
        
        preferredSize: Size.fromHeight(60),
        child: AppBarScreen(icons: Icon(Icons.arrow_back), text: "CheckOut"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              CheckoutList(
                icons: Icon(Icons.location_on_outlined),
                text: "Home",
                subtitle: '1901 Thomridge Cir.shioh,Hawai 81063',
                change: () {},
                title: 'Shopping Address',
              ),
              CheckoutList(
                icons: Icon(Icons.note_alt_outlined),
                text: "Economy",
                subtitle: 'Estimated Arrival 25 August 2023',
                change: () {},
                title: 'Choose Shopping Type',
              ),
              Row(
                children: [
                  AppLabel(
                    text: "Order List",
                    size: AppSize.s20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Container(height: 400, child: OrderList()),
            ],
          ),
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: BottomButton(
            onTap: () {},
            text: "Continue to payment",
            // height: 5, width: 150
          ),
        ),
      ),
    );
  }
}
