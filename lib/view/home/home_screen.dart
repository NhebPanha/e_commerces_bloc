import 'dart:math';

import 'package:e_com_bloc/data/models/home_page_model/home_page_model.dart';
import 'package:e_com_bloc/logic/bloc/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  List<ProductModel> products = [];
  List<Category> categories = [];
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc()..add(HomeEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text("data")),
        body: BlocConsumer<HomePageBloc, HomePageState>(
          listener: (context, state) {
            if (state is GetHomePageSucces) {
              
            }
          },
          builder: (context, state) {
            if(state is GetHomePageLoading){
              
              return Center(child: CircularProgressIndicator());
            }
            return Container(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text(product.description),
                  );
                },
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "favorite",
            ),
          ],
        ),
      ),
    );
  }
}
