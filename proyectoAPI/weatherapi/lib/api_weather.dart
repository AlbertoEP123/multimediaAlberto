import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weatherapi/auth.manager.dart';
import 'api_service.dart';
import 'drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  final AuthManager authManager;

  const HomeScreen(
      {Key? key, required this.username, required this.authManager})
      : super(key: key);

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

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

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
        setState(() {
          _cityName = '';
          _countryInitials = '';
          _weatherData = 'error';
          _isWeatherDataLoaded = false;
        });
      }
    }
  }

  String _formatHour(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute}';
  }

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
        _weatherData =
            'Temperatura actual: $temperatura°C\nSensación térmica: $sensacionTermica°C\nTemperatura Mínima: $tempMinima°C\nTemperatura Máxima: $tempMaxima°C\nHumedad relativa: $humedad%\nPresión atmosférica: $presion hPa\nDescripción del clima: $descripcionClima\nÍndice UV: $indiceUV\nVisibilidad: $visibilidad\nHora del amanecer: ${_convertirUnixAFormatoHora(amanecer)}\nHora del atardecer: ${_convertirUnixAFormatoHora(atardecer)}\nVelocidad del viento: $velocidadViento m/s\nDirección del viento: $direccionViento°\nCoordenadas Geográficas: Latitud: $latitude, Longitud: $longitude';
        _isWeatherDataLoaded = true;
      });
    } catch (e) {
      setState(() {
        _weatherData = 'Error al obtener datos del clima: $e';
      });
    }
  }

  final ThemeData _nightTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );

  final ThemeData _dayTheme = ThemeData.light();

  String _convertirUnixAFormatoHora(int unixTime) {
    var fecha = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    return '${fecha.hour}:${fecha.minute}:${fecha.second}';
  }

  Future<void> _getHourlyWeatherData(String city) async {
    String apiKey = '25ed3f5e8fa270f9f1f38b18e02e25b1';
    try {
      Map<String, dynamic> weatherData =
          await ApiService.getDailyWeatherData(city, apiKey);
      print('Datos del pronóstico por hora: $weatherData');
    } catch (e) {
      setState(() {
        _weatherData = 'Error al obtener datos de pronóstico por hora: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = _isNightMode ? _nightTheme : _dayTheme;
    AuthManager authManager = widget.authManager;

    return MaterialApp(
      theme: currentTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome, ${widget.username}'),
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
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: 'Ciudad',
                        hintText: 'Ingrese una ciudad',
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 9.0, horizontal: 5.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      maxLength: 20,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: _verifyCity,
                      child: const Text('Verificar ciudad'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (_cityName.isNotEmpty)
                Text(
                  'Ciudad: $_cityName, $_countryInitials',
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 20),
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
                child: const Text('Obtener Clima'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final String city = _cityController.text.trim();
                  if (city.isNotEmpty) {
                    try {
                      String apiKey = '25ed3f5e8fa270f9f1f38b18e02e25b1';
                      Map<String, dynamic> dailyWeatherData =
                          await ApiService.getDailyWeatherData(city, apiKey);
                      // Actualizar el estado para mostrar los datos
                      setState(() {
                        _weatherData =
                            'Datos del pronóstico diario del clima: $dailyWeatherData';
                      });
                    } catch (e) {
                      // cualquier error que ocurra al obtener los datos del pronóstico diario del clima
                      print(
                          'Error al obtener datos del pronóstico diario del clima: $e');
                      // mensaje de error
                      setState(() {
                        _weatherData =
                            'Error al obtener datos del pronóstico diario del clima: $e';
                      });
                    }
                  }
                },
                child: const Text('Obtener Clima Extendido'),
              ),
// Widget para mostrar los datos del pronóstico diario del clima
              Text(
                _weatherData,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),
              if (_weatherData.isNotEmpty && _isWeatherDataLoaded)
                Text(
                  _weatherData,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              const SizedBox(height: 20),
              if (_isWeatherDataLoaded)
                ElevatedButton(
                  onPressed: () {
                    launch(
                        'https://www.google.com/maps/search/?api=1&query=$_cityName');
                  },
                  child: const Text('Ver en Google Maps'),
                ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _isNightMode = !_isNightMode;
            });
          },
          child: const Icon(Icons.lightbulb),
        ),
      ),
    );
  }
}
