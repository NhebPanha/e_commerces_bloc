import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:e_com_bloc/data/models/home_page_model/home_page_model.dart';
import 'package:e_com_bloc/data/service/app_services.dart';
import 'package:e_com_bloc/data/service/helper_service.dart';
import 'package:e_com_bloc/utils/api_endpoint.dart';
import 'package:e_com_bloc/utils/constant.dart';
import 'package:meta/meta.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    /// bloc home page
      on<HomeEvent>((event, emit) async {
      
      emit(GetHomePageLoading());
      AppService service = AppService(
        httpMethods: HttpMethods.GET,
        endPoint: ApiEndpoint.getProduct,
        // queryParameters: {'type': event.type},
      );
      final response = await service.send();
      response.fold(
        (l) {
          return emit(
            GetHomePageError(
              title: l.title,
              description: l.description,
              status: l.statusCode,
            ),
          );
        },
        (r) {
          var data = jsonDecode(r.response.toString());
          if (data["result"] != null) {
            final model = ProductModel.fromJson(data);
            return emit(GetHomePageSucces(productModel: model));
          } else {
            return emit(
              GetHomePageError(
                title: Constant.unknownError,
                description: "error",
                status: Constant.unknownStatus,
              ),
            );
          }
        },
      );
    });
  }
}
