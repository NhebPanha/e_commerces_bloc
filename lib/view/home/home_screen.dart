
import 'dart:convert';
import 'dart:developer';

import 'package:e_com_bloc/data/models/product_model/product_model.dart';
import 'package:e_com_bloc/logic/bloc/product_model_bloc/bloc/product_model_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ProductModel> productList = [];
  int page = 0;
  final int perPage = 10;
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ProductModelBloc()..add(FetchProductModelEvent(page: page, perPage: perPage)),
      child: BlocConsumer<ProductModelBloc, ProductModelState>(
        listener: (contextBl, state) {
          if (state is ProductModelErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.description)));
          }
        },
        builder: (contextBl, state) {
          if (state is ProductModelLoadingState) {
            log("message loading page ------------------ ");
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          else if (state is ProductModelSuccesState) {
            final products = state.productList;
            log("message ------------------ : ${jsonEncode(products)}");
            return Scaffold(
              appBar: AppBar(title: const Text("Products"), centerTitle: true),
              body: RefreshIndicator(
                onRefresh: () async {
                  context.read<ProductModelBloc>().add(FetchProductModelEvent(isRefresh: true, page: 0, perPage: perPage));
                },
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 0.75),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final item = products[index];
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(12)), child: Image.network(item.images.isNotEmpty ? item.images.first : 'https://via.placeholder.com/150', width: double.infinity, fit: BoxFit.cover))),
                          Padding(padding: const EdgeInsets.all(8.0), child: Text(item.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Text("\$${item.price.toStringAsFixed(2)}", style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w600))),
                          const SizedBox(height: 6),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          }

          if (state is ProductModelErrorState) {
            return Scaffold(body: Center(child: Text("Error: ${state.description}", style: const TextStyle(color: Colors.red))));
          }

          return const Scaffold(body: Center(child: Text("No products found")));
        },
      ),
    );
  }
}
