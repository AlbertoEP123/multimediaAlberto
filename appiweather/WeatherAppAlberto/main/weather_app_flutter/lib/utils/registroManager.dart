import 'package:shared_preferences/shared_preferences.dart';

class RegistroManager {
  static Future<void> guardarDatos(String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

  static Future<bool> verificarCredenciales(
      String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? storedUsername = await prefs.getString('username');
    final String? storedPassword = await prefs.getString('password');
    return username == storedUsername && password == storedPassword;
  }
}
