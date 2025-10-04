import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../utils/shared_preferences_service.dart';
enum HttpMethods {
  GET, // -> get data
  POST, // -> create data
  PUT, // -> update data
  DELETE, // -> delete data
}
class HttpResponse {
  Response? response;
  bool status;
  HttpResponse({this.response, this.status = false});
}
Future<String?> getToken() async {
  String? token = SharedPreferencesService.instance?.token;
  log("token : $token");
  return token == null ? null : "Bearer $token";
}