part of 'product_model_bloc.dart';

@immutable
abstract class ProductModelState {}

class ProductModelInitial extends ProductModelState {}

class ProductModelLoadingState extends ProductModelState {}

class ProductModelSuccesState extends ProductModelState {
  final List<ProductModel> productList;
  final int total;

  ProductModelSuccesState({
    required this.productList,
    required this.total,
  });
}

class ProductModelErrorState extends ProductModelState {
  final String title;
  final String description;
  final int statusCode;

  ProductModelErrorState({
    required this.title,
    required this.description,
    required this.statusCode,
  });
}
