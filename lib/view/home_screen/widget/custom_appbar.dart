import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_label.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:flutter/widgets.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final IconData icons;
  final String descriptions; 
  final IconData iconNotification;

  const CustomAppbar({super.key, required this.title,required this.icons, required this.descriptions, required this.iconNotification});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppLabel(text: title,size: AppSize.s13,),
              Row(
                children: [
                  Icon(icons,size: AppSize.s25,),
                   AppLabel(text: descriptions,size: AppSize.s17,),
                  ],
              ),
            ],
          ),
        ), 
        Container( 
          margin: const EdgeInsets.only(top: 50.0,right: 20),
          width: AppSize.s50,
          height: AppSize.s50,
          decoration: BoxDecoration(
            color: AppColorsPath.black.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppSize.s50),
            
          ),
          child: Center(
            child: Icon(iconNotification,size: AppSize.s30,),
            ),
        ),
      ],
    );
  }
}