import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/view/checkout_screen/order_list_data.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orDerListData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColorsPath.white),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColorsPath.white.withAlpha(70),
                  offset: Offset(1, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      "${orDerListData[index]['image']}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${orDerListData[index]['name']}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${orDerListData[index]['size']}",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "\$ ${orDerListData[index]['price']}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
