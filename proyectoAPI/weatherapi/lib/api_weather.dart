import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:url_launcher/url_launcher.dart';
import 'package:weatherapi/auth.manager.dart';
import 'api_service.dart';
import 'drawer_widget.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  final String username;
  final AuthManager authManager;

  HomeScreen({required this.username, required this.authManager});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = '';
  String _countryInitials = '';
  String _weatherData = '';
  bool _isWeatherDataLoaded = false;
  bool _isNightMode = false;
  late final String username;

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  // Función para verificar la ciudad
  Future<void> _verifyCity() async {
    final String city = _cityController.text.trim();
    if (city.isNotEmpty) {
      try {
        Map<String, dynamic> weatherData =
            await ApiService.getWeatherData(city);

        final nombreCiudad = weatherData['name'];
        final pais = weatherData['sys']['country'];

        setState(() {
          _cityName = nombreCiudad;
          _countryInitials = pais;
        });
      } catch (e) {
        // Limpiar todos los datos si no se puede cargar la ciudad
        setState(() {
          _cityName = '';
          _countryInitials = '';
          _weatherData = 'error';
          _isWeatherDataLoaded = false;
        });
      }
    }
  }

  // Función para obtener el clima extendido

  String _formatHour(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute}';
  }

// Llamada al método para obtener el pronóstico por hora

  // Función para obtener los datos del clima
  Future<void> _getWeatherData(String city) async {
    try {
      Map<String, dynamic> weatherData = await ApiService.getWeatherData(city);

      final datosPrincipales = weatherData['main'];
      final datosClima = weatherData['weather'][0];
      final coordenadas = weatherData['coord'];

      final nombreCiudad = weatherData['name'];
      final pais = weatherData['sys']['country'];
      final temperatura = datosPrincipales['temp'];
      final sensacionTermica = datosPrincipales['feels_like'];
      final tempMinima = datosPrincipales['temp_min'];
      final tempMaxima = datosPrincipales['temp_max'];
      final humedad = datosPrincipales['humidity'];
      final presion = datosPrincipales['pressure'];
      final descripcionClima = datosClima['description'];
      final indiceUV = weatherData['uvIndex'];
      final visibilidad = weatherData['visibility'];
      final amanecer = weatherData['sys']['sunrise'];
      final atardecer = weatherData['sys']['sunset'];
      final velocidadViento = weatherData['wind']['speed'];
      final direccionViento = weatherData['wind']['deg'];
      final latitude = coordenadas['lat'];
      final longitude = coordenadas['lon'];
      final googleMapsUrl =
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
      setState(() {
        _cityName = '$nombreCiudad, $pais';
        _weatherData = 'Temperatura actual: $temperatura°C\n' +
            'Sensación térmica: $sensacionTermica°C\n' +
            'Temperatura Mínima: $tempMinima°C\n' +
            'Temperatura Máxima: $tempMaxima°C\n' +
            'Humedad relativa: $humedad%\n' +
            'Presión atmosférica: $presion hPa\n' +
            'Descripción del clima: $descripcionClima\n' +
            'Índice UV: $indiceUV\n' +
            'Visibilidad: $visibilidad\n' +
            'Hora del amanecer: ${_convertirUnixAFormatoHora(amanecer)}\n' +
            'Hora del atardecer: ${_convertirUnixAFormatoHora(atardecer)}\n' +
            'Velocidad del viento: $velocidadViento m/s\n' +
            'Dirección del viento: $direccionViento°\n' +
            'Coordenadas Geográficas: Latitud: $latitude, Longitud: $longitude';
        _isWeatherDataLoaded = true;
      });
    } catch (e) {
      setState(() {
        _weatherData = 'Error al obtener datos del clima: $e';
      });
    }
  }

  ThemeData _nightTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
    ),
  );

  ThemeData _dayTheme = ThemeData.light();
  // Función para convertir la hora en formato Unix
  String _convertirUnixAFormatoHora(int unixTime) {
    var fecha = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    return '${fecha.hour}:${fecha.minute}:${fecha.second}';
  }

  Future<void> _getHourlyWeatherData(String city) async {
    try {
      Map<String, dynamic> weatherData =
          await ApiService.getHourlyWeatherData(city);
      // Procesa los datos del pronóstico por hora aquí
      print('Datos del pronóstico por hora: $weatherData');
    } catch (e) {
      setState(() {
        _weatherData = 'Error al obtener datos de pronóstico por hora: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Selecciona el tema apropiado según el modo noche o día
    final ThemeData currentTheme = _isNightMode ? _nightTheme : _dayTheme;
    AuthManager authManager = widget.authManager;

    return MaterialApp(
      theme: currentTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome,${widget.username}'),
        ),
        drawer: DrawerWidget(authManager: authManager),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _cityController,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: 'Ciudad',
                        hintText: 'Ingrese una ciudad',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 9.0, horizontal: 5.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      maxLength: 20,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: _verifyCity,
                      child: const Text('Verificar ciudad'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              if (_cityName.isNotEmpty)
                Text(
                  'Ciudad: $_cityName, $_countryInitials',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final String city = _cityController.text.trim();
                  if (city.isNotEmpty) {
                    if (_weatherData.isNotEmpty && _isWeatherDataLoaded) {
                      setState(() {
                        _weatherData = '';
                        _isWeatherDataLoaded = false;
                      });
                    } else {
                      _getWeatherData(city);
                    }
                  }
                },
                child: Text('Obtener Clima'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final String city = _cityController.text.trim();
                  if (city.isNotEmpty) {
                    ApiService.getHourlyWeatherData(city);
                  }
                },
                child: const Text('Obtener Clima Extendido'),
              ),
              SizedBox(height: 20),
              if (_weatherData.isNotEmpty && _isWeatherDataLoaded)
                Text(
                  _weatherData,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              SizedBox(height: 20),
              if (_isWeatherDataLoaded)
                ElevatedButton(
                  onPressed: () {
                    launch(
                        'https://www.google.com/maps/search/?api=1&query=$_cityName');
                  },
                  child: Text('Ver en Google Maps'),
                ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Cambiar el estado del modo día y noche
            setState(() {
              _isNightMode = !_isNightMode;
            });
          },
          child: Icon(Icons.lightbulb),
        ),
      ),
    );
  }
}
