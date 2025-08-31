import 'package:flutter/material.dart';

class ConfigRouter {
  ConfigRouter._();
  static Future<T?> push<T>(BuildContext context, Widget page) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static void pop(BuildContext context, [result]) {
    Navigator.pop(context, result);
  }

  static Future<T?> pushReplacement<T, TO>(BuildContext context, Widget page, {TO? result}) {
    return Navigator.pushReplacement<T, TO>(
      context,
      MaterialPageRoute(builder: (_) => page),
      result: result,
    );
  }
}