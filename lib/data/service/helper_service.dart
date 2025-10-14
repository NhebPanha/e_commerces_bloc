import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_com_bloc/utils/app_shared_preference.dart';

enum HttpMethods {
  GET,
  POST,
  PUT,
  DELETE,
}

class HttpResponse {
  Response? response;
  bool status;
  HttpResponse({this.response, this.status = false});
}

Future<String?> getToken() async {
  String? token = AppSharedPreference.getToken();
  log("token : $token");
  return token == null ? null : "Bearer $token";
}