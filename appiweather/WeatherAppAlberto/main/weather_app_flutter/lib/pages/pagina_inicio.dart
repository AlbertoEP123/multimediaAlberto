import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pagina_principal.dart';

class RegistroScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _guardarDatos(BuildContext context) async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Las contraseñas no coinciden'),
      ));
      return;
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);

    print('Datos guardados: $username, $password'); // Debugging

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PaginaPrincipal(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          username: username,
        ),
      ),
    );
  }

  Future<void> _iniciarSesion(BuildContext context) async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedUsername = prefs.getString('username');
    final String? savedPassword = prefs.getString('password');

    print('Datos guardados para login: $savedUsername, $savedPassword');

    if (username == savedUsername && password == savedPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PaginaPrincipal(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            username: username,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Nombre de usuario o contraseña incorrectos'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(9, 134, 134, 134),
        elevation: 0,
        title: Text('Registro e Inicio de Sesión'),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bienvenido/a a WeatherApp ',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Nombre de usuario'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 12),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: 'Repetir contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _guardarDatos(context),
              child: Text('Registrarse'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _iniciarSesion(context),
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
