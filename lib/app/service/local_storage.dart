import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<void> saveUserData(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);
  }

  Future<Map<String, String?>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final password = prefs.getString('password');
    return {'username': username, 'password': password};
  }
}
