import 'package:flutter/material.dart';
import 'package:weatherapi/auth.manager.dart';
import 'package:weatherapi/drawer_widget.dart';

/// Pantalla que muestra información sobre la aplicación Weather App y el servicio API.
class AboutScreen extends StatelessWidget {
  final AuthManager authManager;

  const AboutScreen({Key? key, required this.authManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla final'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Weather App es una aplicación para obtener información meteorológica en tiempo real y pronósticos extendidos para diferentes ciudades alrededor del mundo.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'La persistencia de datos en esta aplicacion que se usa es con SharedPreferences, se guarda el usuario registrado en la app y se muestra en la pantalla principal\n este usuario será guardado en la nube.\n A continuacion documentacion de las pantallas:',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Pantalla de Inicio (HomeScreen)\nDescripción:\nLa pantalla de inicio es la primera pantalla que se muestra al usuario al abrir la aplicación. Permite al usuario ingresar una ciudad y obtener información sobre el clima y las coordenadas geográficas de esa ciudad. También proporciona la funcionalidad para cambiar entre los modos de día y noche.\n\nWidgets Principales:\nAppBar: Muestra el título de la aplicación y el nombre de usuario.\nDrawer: Proporciona un menú lateral con opciones de navegación y configuración.\nTextField: Permite al usuario ingresar el nombre de una ciudad.\nElevatedButton: Permite al usuario verificar la ciudad ingresada y obtener el clima actual.\nText: Muestra información sobre la ciudad, el país, el clima y las coordenadas geográficas.\nFloatingActionButton: Permite al usuario cambiar entre los modos de día y noche.\n\nFuncionalidades:\nVerificar la ciudad ingresada.\nObtener el clima actual de la ciudad.\nCambiar entre los modos de día y noche.\n\nFlujo de Navegación:\nLa pantalla de inicio es la pantalla principal de la aplicación y se muestra al abrir la aplicación.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Servicio API (ApiService)\nDescripción:\nEl servicio API proporciona métodos para interactuar con el servicio web de pronóstico del tiempo. Permite obtener datos meteorológicos actuales y pronósticos extendidos para una ciudad específica utilizando una clave de API válida.\n\nMétodos Disponibles:\n- getWeatherData(city: String): Retorna datos meteorológicos actuales para la ciudad especificada.\n- getDailyWeatherData(city: String, apiKey: String): Retorna pronósticos extendidos para la ciudad especificada utilizando la clave de API proporcionada.\n\nRequisitos:\n- La aplicación requiere una clave de API válida para acceder al servicio meteorológico.',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'AuthManager:\n'
                'Administra la autenticación de usuario mediante el almacenamiento de datos en SharedPreferences. Ofrece métodos para iniciar sesión y registrar nuevos usuarios.',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(
        authManager: authManager,
      ),
    );
  }
}
