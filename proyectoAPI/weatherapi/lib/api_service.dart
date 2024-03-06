import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<Map<String, dynamic>> getWeatherData(String city) async {
    final String apiKey = '25ed3f5e8fa270f9f1f38b18e02e25b1';
    final String apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  static Future<Map<String, dynamic>> getHourlyWeatherData(String city) async {
    // URL de la API para obtener el pronóstico por hora
    final String apiKey = '25ed3f5e8fa270f9f1f38b18e02e25b1';
    final String apiUrl =
        'https://pro.openweathermap.org/data/2.5/forecast/hourly?lat=57&lon=-2.15&appid=$apiKey}';

    // Realizar la solicitud HTTP
    final http.Response response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Decodificar la respuesta JSON
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      // En caso de error, lanzar una excepción
      throw Exception('Error al obtener datos de pronóstico por hora');
    }
  }
}
