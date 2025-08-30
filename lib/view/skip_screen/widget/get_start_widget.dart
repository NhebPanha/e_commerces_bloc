import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_image_png_path.dart';
import 'package:e_com_bloc/view/skip_screen/widget/custom_widget_get_start.dart';
import 'package:flutter/widgets.dart';
class GetStartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              CustomWidgetGetStart(
                image: AppImagePngPath.profile,
                height: 500,
                width: 200,
                color: AppColorsPath.green,
                borderRadius: BorderRadius.circular(100),
              ),
            ],
          ),
          SizedBox(width: 10,),
          Column(
            children: [
              CustomWidgetGetStart(
                image: AppImagePngPath.kimli,
                height: 300,
                width: 200,
                color: AppColorsPath.green,
                borderRadius: BorderRadius.circular(100),
              ),
              SizedBox(height: 10),
              CustomWidgetGetStart(
                image: AppImagePngPath.peakrat,
                height: 200,
                width: 200,
                color: AppColorsPath.green,
                borderRadius: BorderRadius.circular(100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
