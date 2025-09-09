
import 'dart:developer';

import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_label.dart' show AppLabel;
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/utils/config_routs.dart';
import 'package:e_com_bloc/view/skip_screen/skip_screen.dart';
import 'package:e_com_bloc/view/skip_screen/widget/buttom_get_start_widget.dart';
import 'package:e_com_bloc/view/skip_screen/widget/get_start_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetStartWidget(),
          AppLabel(
            text:
                "the fashion app that the fashion app that the fashion app that",
            size: AppSize.s30,
            maxLines: 2,
            textAlign: TextAlign.center,
            fontFamily: "dynapuff",
          ),
          AppLabel(
            text:
                "the fashion app that the fashion app that the fashion app that",
            size: AppSize.s20,
            maxLines: 2,
            textAlign: TextAlign.center,
            fontFamily: "dynapuff",
            fontWeight: FontWeight.w200,
            color: AppColorsPath.grey.withValues(alpha: 0.5),
          ),
          SizedBox(height: 20),
          ButtomGetStartWidget(
            onClick: (){
              log("next page");
              ConfigRouter.push(context, SkipScreen());
            },
            title: "Les't Get Started",
            size: AppSize.s18,
            fontWeight: FontWeight.bold,
            fonts: "funnel",
            radius: 20,
            colors: AppColorsPath.purple.withValues(alpha: 0.5),
            border: Border.all(color: AppColorsPath.yellow),
          ),
        ],
      ),
    );
  }
}
