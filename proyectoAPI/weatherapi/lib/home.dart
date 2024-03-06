import 'package:flutter/material.dart';
import 'package:weatherapi/api_weather.dart';
import 'package:weatherapi/auth.manager.dart';
import 'drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'drawer_widget.dart'; // Suponiendo que ya tienes la pantalla HomeScreen creada

class HomeScreenWithDrawer extends StatelessWidget {
  final AuthManager authManager;

  HomeScreenWithDrawer({required this.authManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      drawer: DrawerWidget(
        authManager: authManager,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginForm(
                authManager:
                    authManager), // Pasar AuthManager al widget LoginForm
            SizedBox(height: 20),
            RegistrationForm(
                authManager:
                    authManager), // Pasar AuthManager al widget RegistrationForm
          ],
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  final AuthManager authManager;

  RegistrationForm({required this.authManager});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Usuario',
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Contraseña',
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _repeatPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Repetir contraseña',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              String username = _usernameController.text;
              String password = _passwordController.text;
              String repeatPassword = _repeatPasswordController.text;

              if (password == repeatPassword) {
                await widget.authManager.register(username, password);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Las contraseñas no coinciden.'),
                  ),
                );
              }
            },
            child: Text('Registrarse'),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final AuthManager authManager;

  LoginForm({required this.authManager});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Usuario',
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Contraseña',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              String username = _usernameController.text;
              String password = _passwordController.text;

              bool success = await widget.authManager.login(username, password);
              if (success) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      username: username,
                      authManager: widget.authManager,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Credenciales inválidas. Inténtalo de nuevo.'),
                  ),
                );
              }
            },
            child: Text('Iniciar sesión'),
          ),
        ],
      ),
    );
  }
}
