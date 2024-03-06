import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static const _keyUsername = 'username';
  static const _keyPassword = 'password';

  final SharedPreferences prefs;

  AuthManager({required this.prefs});

  Future<bool> login(String username, String password) async {
    // Obtener la contraseña almacenada para el usuario dado
    String? storedPassword = prefs.getString(_keyPassword);

    // Verificar si las credenciales coinciden con las almacenadas
    if (storedPassword == password) {
      return true; // Credenciales válidas
    } else {
      return false; // Credenciales inválidas
    }
  }

  Future<void> register(String username, String password) async {
    // Guardar las credenciales del usuario
    await prefs.setString(_keyUsername, username);
    await prefs.setString(_keyPassword, password);
  }
}
