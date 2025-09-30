import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_image_png_path.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/view/skip_screen/widget/custom_widget_get_start.dart';
import 'package:flutter/widgets.dart';

class GetStartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              CustomWidgetGetStart(
                image: AppImagePngPath.profile,
                height: 500,
                width: 190,
                color: AppColorsPath.green,
                border: Border.all(
                  width: AppSize.s2,
                  color: AppColorsPath.black.withValues(alpha: 0.2),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ],
          ),
          SizedBox(width: 10),
          Column(
            children: [
              CustomWidgetGetStart(
                image: AppImagePngPath.kimli,
                height: 300,
                width: 170,
                border: Border.all(
                  width: AppSize.s2,
                  color: AppColorsPath.black.withValues(alpha: 0.2),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              SizedBox(height: 10),
              CustomWidgetGetStart(
                image: AppImagePngPath.peakrat,
                height: 200,
                width: 170,
                border: Border.all(
                  width: AppSize.s2,
                  color: AppColorsPath.black.withValues(alpha: 0.2),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
