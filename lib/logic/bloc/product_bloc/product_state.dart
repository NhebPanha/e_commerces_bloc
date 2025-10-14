part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class GetProductLoadingState extends ProductState {}

class GetProductLoadingMoreState extends ProductState {}

class GetProductLoadedState extends ProductState {
  final List<ProductModel> productList;
  GetProductLoadedState({required this.productList});
}

class GetProductFailedState extends ProductState {
  final String title;
  final String description;
  final int statusCode;
  GetProductFailedState({
    required this.title,
    required this.description,
    required this.statusCode,
  });
}
