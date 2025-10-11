part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

final class GetProductEvent extends ProductEvent{
  final int page, perPage;
  final bool isLoadMore, isRefresh;
  final List<ProductModel> productList;
  GetProductEvent({required this.page, required this.perPage, this.isLoadMore = false, this.isRefresh = false, required this.productList});
}
