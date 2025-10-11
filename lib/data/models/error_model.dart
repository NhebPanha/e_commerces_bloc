// To parse this JSON data, do
//
//     final networkErrorModel = networkErrorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel networkErrorModelFromJson(String str) =>
    ErrorModel.fromJson(json.decode(str));

String networkErrorModelToJson(ErrorModel data) =>
    json.encode(data.toJson());

class ErrorModel {
  ErrorModel({
    required this.title,
    required this.description,
    required this.statusCode,
    this.data,
  });

  String title;
  String description;
  int statusCode;
  dynamic data;

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      ErrorModel(
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        statusCode: json["statusCode"] ?? "",
        data: json["data"] ?? "",
      );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "statusCode": statusCode,
    "data": data,
  };
}
