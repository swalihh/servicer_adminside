import 'package:shared_preferences/shared_preferences.dart';

class Sharedprfe {
  Sharedprfe._();
  static final _instance = Sharedprfe._();
  static Sharedprfe get instance => _instance;

  static late final SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  addToken(String token) async {
    await prefs.setString("token", token);
  }

  getToken() {
    var token = prefs.getString("token");
    return token;
  }

  removeToken() {
    prefs.remove('token');
  }
}
