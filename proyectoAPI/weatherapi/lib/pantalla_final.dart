import 'package:flutter/material.dart';
import 'package:weatherapi/drawer_widget.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de'),
      ),
      body: Center(
        child: Text(
          'Weather App - Información de la aplicación',
          style: TextStyle(fontSize: 20),
        ),
      ),
            drawer: DrawerWidget(),

    );
  }
}
