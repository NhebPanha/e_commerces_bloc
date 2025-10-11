
import 'dart:developer';
import 'package:e_com_bloc/components/config_file_path/config_routs.dart';
import 'package:e_com_bloc/data/models/skip_model/skip_model.dart';
import 'package:e_com_bloc/view/register/sign_in.dart';
import 'package:e_com_bloc/view/skip_screen/widget/cart_skip_screen.dart';
import 'package:flutter/material.dart';
class SkipScreen extends StatefulWidget {
  const SkipScreen({super.key});
  @override
  State<SkipScreen> createState() => _SkipScreenState();
}
class _SkipScreenState extends State<SkipScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  void _nextPage() {
    if (_currentIndex < skipModelData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  void _previousPage() async {
    if (_currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // PageView
            PageView.builder(
              controller: _controller,
              itemCount: skipModelData.length,
              physics: BouncingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final data = skipModelData[index];
                return CartSkipScreen(
                  image: data.image,
                  desc: data.desc, 
                  index: _currentIndex, 
                  onNextPage: (){
                    _nextPage();
                  }, 
                  onPreviousPage: (){
                    _previousPage();
                  }, 
                  title1: data.title1, title2: data.title2, 
                  onClick: (){
                    ConfigRouter.push(context, SignInScreen());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
