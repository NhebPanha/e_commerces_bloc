import 'package:e_com_bloc/data/skip_model/skip_model.dart';
import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_label.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartSkipScreen extends StatelessWidget {
  final String title1;
  final String title2;
  final String image;
  final String desc;
  final int? index;
  final VoidCallback? onPreviousPage;
  final VoidCallback? onNextPage;
  final Function()? onClick;

  CartSkipScreen({
    required this.title1,
    required this.title2,
    required this.image,
    required this.desc,
    required this.index,
    required this.onPreviousPage,
    required this.onNextPage,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        // Top bar with Skip
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Insightlancer",
                style: TextStyle(
                  color: AppColorsPath.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: onClick,
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Mockup image
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(image, fit: BoxFit.contain),
          ),
        ),
        // Bottom content
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: AppColorsPath.grey.withValues(alpha: 0.3),
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
            children: [
              // Title
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: title1,
                      style: const TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    TextSpan(
                      text: title2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              AppLabel(
                text: desc,
                size: AppSize.s14,
                color: AppColorsPath.grey,
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  if (index! > 0)
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.brown,
                      ),
                      onPressed: onPreviousPage,
                    )
                  else
                    const SizedBox(width: 48),
                  // Dot indicators
                  Row(
                    children: List.generate(
                      skipModelData.length,
                      (dotIndex) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: index == dotIndex ? 10 : 6,
                        height: index == dotIndex ? 10 : 6,
                        decoration: BoxDecoration(
                          color:
                              index == dotIndex
                                  ? Colors.brown
                                  : Colors.grey.shade400,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  // Next button
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.brown,
                    ),
                    onPressed: onNextPage,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
