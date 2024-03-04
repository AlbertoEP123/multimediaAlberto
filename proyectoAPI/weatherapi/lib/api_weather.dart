import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'api_service.dart';
import 'drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _weatherData = '';
  String _cityName = '';
  bool _isWeatherDataLoaded = false;

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
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

  String _convertirUnixAFormatoHora(int unixTime) {
    var fecha = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    return '${fecha.hour}:${fecha.minute}:${fecha.second}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Ciudad',
                hintText: 'Ingrese una ciudad',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String city = _cityController.text.trim();
                if (city.isNotEmpty) {
                  _getWeatherData(city);
                }
              },
              child: Text('Verificar ciudad'),
            ),
            SizedBox(height: 20),
            if (_cityName.isNotEmpty && _isWeatherDataLoaded)
              Text(
                'Ciudad Seleccionada: $_cityName',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 20),
            if (_isWeatherDataLoaded)
              ElevatedButton(
                onPressed: () {
                  // Aquí deberías agregar la lógica para el segundo filtro
                },
                child: Text('Segundo filtro'),
              ),
            SizedBox(height: 20),
            if (_weatherData.isNotEmpty && _isWeatherDataLoaded)
              Text(
                _weatherData,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 20),
            if (_weatherData.isNotEmpty && _isWeatherDataLoaded)
              ElevatedButton(
                onPressed: () {
                  launch('https://www.google.com/maps/search/?api=1&query=');
                },
                child: Text('Ver en Google Maps'),
              ),
          ],
        ),
      ),
    );
  }
}
