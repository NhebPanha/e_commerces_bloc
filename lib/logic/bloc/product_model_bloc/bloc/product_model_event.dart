part of 'product_model_bloc.dart';

@immutable
abstract class ProductModelEvent {}

class FetchProductModelEvent extends ProductModelEvent {
  final int page; // skip offset
  final int perPage; // limit count
  final bool isRefresh;
  final bool isLoadMore;
  final List<ProductModel>? oldList;

  FetchProductModelEvent({
    this.page = 0,
    this.perPage = 10,
    this.isRefresh = false,
    this.isLoadMore = false,
    this.oldList,
  });
}
