import 'dart:convert';

import 'package:http/http.dart' as http;
//
import '../model/weather_model.dart';

class WeatherApiClient {
  Future<WeatherModel> getCurrentWeather(String? location) async {
    var endPoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=25ed3f5e8fa270f9f1f38b18e02e25b1&units=metric");

    var response = await http.get(endPoint);
    print(response.statusCode);
    var body = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(body);

    return weather;
  }
}