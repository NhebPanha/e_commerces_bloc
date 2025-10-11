import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_com_bloc/data/models/error_model.dart';
import 'package:e_com_bloc/utils/constants.dart';
import '../../../configs/config_reader.dart';
import 'check_internet_service.dart';
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
  Future<Either<ErrorModel, HttpResponse>> send() async {
    Options options = Options(headers: {'Accept': 'application/json', 'Authorization': await getToken()});
    Response response;
    String url = baseUrl + endPoint;
    log("url-api: $url");
    log("print------Param-----QueryParameters: ${jsonEncode(queryParameters)}");
    log("print------Param-----Data: $data");
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
        // log("response Method: [$methodName]: Success");
        log("response Method: [$methodName]: $response");
        return Right(HttpResponse(response: response, status: true));
      }
    } catch (e) {
      log("response Method: [$methodName] Catch: $e");
      bool isHasInternet = await CheckInternetService.checkDataConnection();
      if (isHasInternet) {
        return Left(ErrorModel(title: Constants.unKnownError, description: e.toString(), statusCode: Constants.codeUnknown));
      } else {
        return Left(ErrorModel(title: Constants.noInternet, description: Constants.pleaseCheckInternet, statusCode: Constants.codeNetwork));
      }
    }

    log("response: Method: [$methodName] Error");
    return Left(ErrorModel(title: "Error", description: "Something Went Wrong", statusCode: 500));
  }
}
