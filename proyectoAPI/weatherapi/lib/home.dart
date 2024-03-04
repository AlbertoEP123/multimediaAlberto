import 'package:flutter/material.dart';
import 'drawer_widget.dart';

class HomeScreenWithDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      drawer: DrawerWidget(),
      body: Container(), // No carga ningún contenido inicialmente
    );
  }
}
