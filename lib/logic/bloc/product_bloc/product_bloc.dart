// import 'dart:convert';
// import 'package:bloc/bloc.dart';
// import 'package:e_com_bloc/data/service/api_end_point.dart' show ApiEndPoint;
// import 'package:e_com_bloc/data/service/app_services.dart';
// import 'package:e_com_bloc/data/service/helper_service.dart';
// import 'package:meta/meta.dart';
// import '../../../data/models/products_model/product_model.dart';

// part 'product_event.dart';
// part 'product_state.dart';

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   ProductBloc() : super(ProductInitial()) {
//     on<GetProductEvent>((event, emit) async {
//       if (event.isLoadMore) {
//         emit(GetProductLoadingMoreState());
//       } else if (!event.isRefresh) {
//         emit(GetProductLoadingState());
//       }
//       Map<String, dynamic> param;
//       param = {'limit': event.perPage, 'skip': event.page};
//       AppService service = AppService(httpMethods: HttpMethods.GET, endPoint: ApiEndPoint.product, queryParameters: param);
//       final response = await service.send();
//       response.fold(
//         (l) {
//           return emit(GetProductFailedState(title: l.title, description: l.description, statusCode: l.statusCode));
//         },
//         (r) {
//           final data = jsonDecode(r.response.toString());
//           final model = ProductFeedModel.fromJson(data);
//           if (event.isLoadMore) {
//             final allProducts = List<ProductModel>.from(event.productList)..addAll(model.products);
//             emit(GetProductLoadedState(productList: allProducts, total: model.total));
//           } else {
//             emit(GetProductLoadedState(productList: model.products, total: model.total));
//           }
//         },
//       );
//     });
//   }
// }
