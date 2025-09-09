// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../utils/app_image_png_path.dart';

class SkipModel {
  final String title1;
  final String title2;
  final String image;
  final String desc;

  SkipModel({
    required this.title1,
    required this.title2,
    required this.image,
    required this.desc,
  });
}

List<SkipModel> skipModelData = [
  SkipModel(
    title1: "Seamless",
    title2: "Shopping Experience",
    image: AppImagePngPath.peakrat,
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
  ),
  SkipModel(
    title1: "Wishlist: Where",
    title2: "Fashion Dreams Begin",
    image: AppImagePngPath.peakrat,
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
  ),
  SkipModel(
    title1: "Swift and Reliable",
    title2: "Fashion Dreams Begin",
    image: AppImagePngPath.peakrat,
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
  ),
];
