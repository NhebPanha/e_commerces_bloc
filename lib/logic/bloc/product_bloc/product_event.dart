part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetProductEvent extends ProductEvent {
  final int page;
  final int perPage;
  final bool isLoadMore;
  final bool isRefresh;
  final List<ProductModel> productList;

  GetProductEvent({
    this.page = 0,
    this.perPage = 10,
    this.isLoadMore = false,
    this.isRefresh = false,
    this.productList = const [],
  });
}
