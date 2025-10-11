import 'dart:convert';
import 'package:flutter/services.dart';

import 'environment.dart';

abstract class ConfigReader {
  static Map<String, dynamic>? _config;
  static Environment? env;

  static Future<void> initialize(Environment environment) async {
    env = environment;
    final configString = await rootBundle.loadString(environment.value());
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String baseUrl() {
    return _config?['base_url'] as String;
  }

  static String host() {
    return _config?['host'] as String;
  }

  static String rootApi() {
    return _config?['root_api'] as String;
  }

  static String telegramApi() {
    return _config?['telegram_api'] as String;
  }
  static String hostSocket() {
    return _config?['host_socket'] as String;
  }

  static String portSocket() {
    return _config?['port_socket'] as String;
  }
  static String pusherKey() {
    return _config?['pusher_key'] as String;
  }
  static String envKey() {
    return _config?['env_key'] as String;
  }

  static String androidGoogleMapKey() {
    return _config?['android_google_map_key'] as String;
  }

  static String iOSGoogleMapKey() {
    return _config?['iOS_google_map_key'] as String;
  }
}
