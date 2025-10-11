import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:e_com_bloc/data/models/product_model/product_model.dart';
import 'package:meta/meta.dart';
import 'package:e_com_bloc/data/service/api_end_point.dart';
import 'package:e_com_bloc/data/service/app_services.dart';
import 'package:e_com_bloc/data/service/helper_service.dart';

part 'product_model_event.dart';
part 'product_model_state.dart';

class ProductModelBloc extends Bloc<ProductModelEvent, ProductModelState> {
  ProductModelBloc() : super(ProductModelInitial()) {
    on<FetchProductModelEvent>(_onFetchProductModel);
  }

  Future<void> _onFetchProductModel(FetchProductModelEvent event, Emitter<ProductModelState> emit) async {
    // try {
    // Loading logic
    emit(ProductModelLoadingState());
    // Send API request
    final service = AppService(httpMethods: HttpMethods.GET, endPoint: ApiEndPoint.getAllProduct);

    final response = await service.send();

    response.fold((error) => emit(ProductModelErrorState(title: error.title, description: error.description, statusCode: error.statusCode)), (success) {
      final Map<String, dynamic> jsonData = jsonDecode(success.response.toString());
      final productFeed = ProductFetchModel.fromJson(jsonData);
      if (event.isLoadMore && event.oldList != null) {
        // Append new items for pagination
        final updatedList = [...event.oldList!, ...productFeed.products];
        emit(ProductModelSuccesState(productList: updatedList, total: productFeed.total));
      } else {
        // First load or refresh
        emit(ProductModelSuccesState(productList: productFeed.products, total: productFeed.total));
      }
    });
  }
}
