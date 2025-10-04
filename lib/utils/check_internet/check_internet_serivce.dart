import 'package:http/http.dart' as http;
class CheckInternetService{
  static Future<bool> checkDataConnection() async {
    bool isAccess = await _checkInternetAccess();
    if (isAccess) {
      return true;
    } else {
      return false;
    }
  }
}
Future<bool> _checkInternetAccess() async {
  try {
    final response = await http.get(Uri.parse('https://www.google.com')).timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      // status code 200 means successful connection
      return true;
    } else {
      return false;
    }
  } catch (e) {
    // catch any exceptions or errors
    return false;
  }
}