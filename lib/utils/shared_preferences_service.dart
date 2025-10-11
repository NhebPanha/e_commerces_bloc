import 'package:shared_preferences/shared_preferences.dart';
/// Constants for SharedPreferences
class SharedPrefKeys {
  SharedPrefKeys._();
  static const String languageCode = 'languageCode';
  static const String onsignalUserId = 'onsignalUserId';
}
class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;
  SharedPreferencesService._internal();
  static Future<void> init() async {
    _instance = SharedPreferencesService._internal();
    _preferences = await SharedPreferences.getInstance();
  }
  static SharedPreferencesService? get instance {
    if (_instance == null) {
      throw Exception('Please call init in main.dart');
    }
    return _instance;
  }
  //Set Application Token
  Future<void> setToken(String token) async => await _preferences?.setString('token', token);

  String? get token => _preferences?.getString('token');
  Future<void> removeToken() async => await _preferences?.remove('token');

  Future<void> setUserId(String token) async => await _preferences?.setString('userId', token);

  String? get getUserId => _preferences?.getString('userId');
  Future<void> removeUserId() async => await _preferences?.remove('userId');

  Future<void> setUserName(String token) async => await _preferences?.setString('userName', token);
  String? get getUserName => _preferences?.getString('userName');
  Future<void> removeUserName() async => await _preferences?.remove('userName');

  Future<void> setUserImage(String token) async => await _preferences?.setString('userImage', token);
  String? get getUserImage => _preferences?.getString('userImage');
  Future<void> removeUserImage() async => await _preferences?.remove('userImage');

  Future<void> setUserAddress(String token) async => await _preferences?.setString('userAdd', token);

  String? get getUserAddress => _preferences?.getString('userAdd');
  Future<void> removeUserAddress() async => await _preferences?.remove('userAdd');

  //Set Firbase User Token
  Future<void> setFirebaseUserToken(String token) async => await _preferences?.setString('firebase_user_token', token);

  String? get firebaseUserToken => _preferences?.getString('firebase_user_token');
  Future<void> removeFirebaseUserToken() async => await _preferences?.remove('firebase_user_token');

  //Set User Profile
  Future<void> setUserProfile(String userProfile) async => await _preferences?.setString('user_profile', userProfile);

  String? get getUserProfile => _preferences?.getString('user_profile');
  Future<void> removeUserProfile() async => await _preferences?.remove('user_profile');

  // Set data_v2 home page
  Future<void> setDataHomePage(String data) async => await _preferences?.setString('home_page', data);
  // Get data_v2 home page
  String? get getDataHomePage => _preferences?.getString('home_page');
  Future<void> removeHomeData() async => await _preferences?.remove('home_page');

  Future<void> removeUserCart() async => await _preferences?.remove('cart_data_local');

  Future<void> setAppLanguage(String lan) async => await _preferences?.setString('languages', lan);

  String? get getAppLanguage => _preferences?.getString('languages');
}
