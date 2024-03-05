import 'package:flutter/material.dart';
import 'package:weatherapi/api_weather.dart';
import 'pantalla_final.dart';
import 'home.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/weather.jpg'), // Agrega la imagen de encabezado desde los assets
                fit: BoxFit.cover,
              ),
            ), child: null,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Pantalla de Inicio'),
            onTap: () {
              var prefs;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreenWithDrawer(prefs: prefs,)),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.api),
            title: Text('Api'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen(username: '')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('Pantalla de Finalizacion'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
