import 'package:flutter/material.dart';
import 'package:weatherapi/auth.manager.dart';
import 'package:weatherapi/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AuthManager authManager = AuthManager(prefs: prefs);
  runApp(MyWeatherApp(authManager: authManager));
}

class MyWeatherApp extends StatelessWidget {
  final AuthManager authManager;

  const MyWeatherApp({Key? key, required this.authManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreenWithDrawer(
        authManager: authManager,
      ),
    );
  }
}
