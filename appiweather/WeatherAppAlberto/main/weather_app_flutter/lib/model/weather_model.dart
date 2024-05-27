class WeatherModel {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feelsLike;
  String? status;
  String? country;
  double? temp_min;
  //
  WeatherModel({
    required this.cityName,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.feelsLike,
    required this.status,
    required this.country,
    required this.temp_min,
  });

  //

  WeatherModel.fromJson(Map<String, dynamic> json) {
    cityName = json["name"] as String?;
    temp = json["main"]["temp"] as double?;
    wind = json["wind"]["speed"] as double?;
    humidity = json["main"]["humidity"]as int?;
    feelsLike = json["main"]["feels_like"]as double?;
    status = json["weather"][0]["main"]as String?;
    country = json["sys"]["country"]as String?;
    temp_min = json["main"]["temp_min"]as double?;


  }
}
