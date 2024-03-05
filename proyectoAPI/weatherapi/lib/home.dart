import 'package:flutter/material.dart';
import 'package:weatherapi/api_weather.dart';
import 'drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'drawer_widget.dart'; // Suponiendo que ya tienes la pantalla HomeScreen creada

class HomeScreenWithDrawer extends StatelessWidget {
  final SharedPreferences prefs;

  HomeScreenWithDrawer({required this.prefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginForm(prefs: prefs), // Pasa SharedPreferences al widget LoginForm
            SizedBox(height: 20),
            RegistrationForm(prefs: prefs), // Pasa SharedPreferences al widget RegistrationForm
          ],
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  final SharedPreferences prefs;

  RegistrationForm({required this.prefs});

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
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString(username,
                    password); // Guardar el usuario y contraseña en SharedPreferences
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
   final SharedPreferences prefs;

  LoginForm({required this.prefs});

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

              // Aquí puedes realizar la lógica de autenticación
              if (username == 'usuario' && password == 'contraseña') {
                // Autenticación exitosa, guarda el nombre de usuario
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('username', username);

                // Navega a la pantalla HomeScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(username: username)),
                );
              } else {
                // Autenticación fallida, muestra un mensaje de error
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
