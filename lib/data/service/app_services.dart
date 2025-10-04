import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../configs/config_reader.dart';
import '../../../data/models/network_error_model/network_error_model.dart';
import '../../../utils/check_internet/check_internet_serivce.dart';
import '../../utils/constant.dart';
import 'helper_service.dart';
class AppService {
  HttpMethods httpMethods;
  String endPoint;
  String? data;
  Map<String, dynamic>? queryParameters;
  FormData? formData;
  Dio dio = Dio();
  String baseUrl = ConfigReader.rootApi();
  AppService({required this.httpMethods, required this.endPoint, this.data, this.queryParameters, this.formData});
  Future<Either<NetworkErrorModel, HttpResponse>> send() async {
    Options options = Options(headers: {"Content-Type": "application/json", "Accept": "application/json", "Charset": "utf-8", 'Authorization': await getToken()});
    Response response;
    String url = baseUrl + endPoint;
    String methodName = "";
    try {
      switch (httpMethods) {
        case HttpMethods.GET:
          methodName = "GET";
          response = await dio.get(url, queryParameters: queryParameters, options: options);
          break;

        case HttpMethods.POST:
          methodName = "POST";
          options.headers!['Content-Type'] = 'application/json';
          response = await dio.post(url, data: formData ?? queryParameters, options: options);
          break;

        case HttpMethods.PUT:
          methodName = "PUT";
          options.headers!['Content-Type'] = 'application/json';
          response = await dio.put(url, data: data ?? queryParameters, options: options);
          break;

        case HttpMethods.DELETE:
          methodName = "DELETE";
          response = await dio.delete(url, data: queryParameters, options: options);
          break;
      }
      if (response.statusCode == 200) {
        log("response Method: [$methodName]: Success");
        // log("response Method: [$methodName]: $response");
        return Right(HttpResponse(response: response, status: true));
      }
    } catch (e) {
      log("response Method: [$methodName] Catch: $e");
      bool isHasInternet = await CheckInternetService.checkDataConnection();
      if (isHasInternet) {
        return Left(NetworkErrorModel(title: Constant.unknownError, description: e.toString(), statusCode: Constant.unknownStatus));
      } else {
        return Left(NetworkErrorModel(title: Constant.noInternetConnection, description: Constant.pleaseCheckYourInternetConnection, statusCode: Constant.noInternetStatus));
      }
    }
    log("response: Method: [$methodName] Error");
    return Left(NetworkErrorModel(title: "Error", description: "Something Went Wrong", statusCode: 500));
  }
}
