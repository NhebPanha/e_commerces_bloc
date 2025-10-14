import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:e_com_bloc/data/service/api_end_point.dart';
import 'package:e_com_bloc/data/service/app_services.dart';
import 'package:e_com_bloc/data/service/helper_service.dart';
import 'package:meta/meta.dart';
import '../../../data/models/products_model/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      try {
        if (event.isLoadMore) {
          emit(GetProductLoadingMoreState());
        } else if (!event.isRefresh) {
          emit(GetProductLoadingState());
        }

        // Setup query params
        final param = {'limit': event.perPage, 'skip': event.page};

        // Send GET request
        final service = AppService(
          httpMethods: HttpMethods.GET,
          endPoint: ApiEndPoint.product,
          queryParameters: param,
        );

        final response = await service.send();

        // Handle response
        response.fold(
          (l) => emit(GetProductFailedState(
            title: l.title,
            description: l.description,
            statusCode: l.statusCode,
          )),
          (r) {
            final data = jsonDecode(r.response.toString());

            // Expecting a list of products from API
            final List<ProductModel> products = List<ProductModel>.from(
              data.map((item) => ProductModel.fromJson(item)),
            );

            // Load more logic
            if (event.isLoadMore) {
              final updatedList = List<ProductModel>.from(event.productList)
                ..addAll(products);
              emit(GetProductLoadedState(productList: updatedList));
            } else {
              emit(GetProductLoadedState(productList: products));
            }
          },
        );
      } catch (e) {
        emit(GetProductFailedState(
          title: 'Error',
          description: e.toString(),
          statusCode: 500,
        ));
      }
    });
  }
}
