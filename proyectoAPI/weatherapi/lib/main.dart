import 'package:flutter/material.dart';
import 'package:weatherapi/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyWeatherApp(prefs: prefs));
}

class MyWeatherApp extends StatelessWidget {
  final SharedPreferences prefs;

  MyWeatherApp({required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreenWithDrawer(prefs: prefs), // Pasa SharedPreferences al widget HomeScreenWithDrawer
    );
  }
}
