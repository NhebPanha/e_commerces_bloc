import 'dart:developer';
import 'package:e_com_bloc/data/models/products_model/product_model.dart';
import 'package:e_com_bloc/logic/bloc/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final int perPage = 10;
  int page = 0;
  List<ProductModel> allProducts = [];
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    // Add listener for infinite scroll
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore) {
        isLoadingMore = true;
        page++;
        context.read<ProductBloc>().add(
              GetProductEvent(
                page: page,
                perPage: perPage,
                isLoadMore: true,
                productList: allProducts,
              ),
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductBloc()..add(GetProductEvent(page: page, perPage: perPage)),
      child: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is GetProductFailedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.description)));
          }

          if (state is GetProductLoadedState) {
            isLoadingMore = false;
            allProducts = state.productList;
          }
        },
        builder: (context, state) {
          if (state is GetProductLoadingState && allProducts.isEmpty) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is GetProductFailedState && allProducts.isEmpty) {
            return Scaffold(
              body: Center(
                child: Text(
                  "Error: ${state.description}",
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }

          if (allProducts.isEmpty) {
            return const Scaffold(
              body: Center(child: Text("No products found")),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text("Products"),
              centerTitle: true,
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                page = 0;
                allProducts.clear();
                context.read<ProductBloc>().add(
                      GetProductEvent(
                        page: page,
                        perPage: perPage,
                        isRefresh: true,
                      ),
                    );
              },
              child: GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(10),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: allProducts.length +
                    ((state is GetProductLoadingMoreState) ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == allProducts.length) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final item = allProducts[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.network(
                              item.images.isNotEmpty
                                  ? item.images.first
                                  : 'https://via.placeholder.com/150',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "\$${item.price.toString()}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
