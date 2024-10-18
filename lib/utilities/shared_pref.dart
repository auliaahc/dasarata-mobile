import 'package:shared_preferences/shared_preferences.dart';

String _keyToken = "token";

class SharedPref {
  static void saveToken({required String token}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_keyToken, token);
  }
  static Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(_keyToken);
    return token;
  }
  static void removeToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(_keyToken);
  }
}