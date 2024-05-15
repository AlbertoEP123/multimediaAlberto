import 'package:flutter/material.dart';
import '../utils/constants.dart'; // Asegúrate de importar el archivo constants.dart correctamente
import '../services/weather_api_client.dart';
import '../model/weather_model.dart';
import '../widget/current_weather.dart';
import '../widget/more_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherApiClient weatherapi = WeatherApiClient();
  WeatherModel? data;
  TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          // Utilizamos width y height obtenidos de MediaQuery
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.darken),
              filterQuality: FilterQuality.high,
              image: AssetImage("assets/images/backG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        hintText: 'Enter city',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        getData(_cityController.text);
                      });
                    },
                    child: Text('Search'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: loadedData(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<void> loadedData() {
    return FutureBuilder(
      future: getData(_cityController.text),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (data != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                currentWeather(
                  onPressed: () {
                    setState(() {
                      loadedData(); // Se elimina esta línea, ya que la solicitud ya se realiza en el onPressed del botón "Search"
                    });
                  },
                  temp: "${data!.temp}",
                  location: "${data!.cityName}",
                  status: "${data!.status}",
                  country: "${data!.country}",
                ),
                moreInfo(
                  wind: "${data!.wind}",
                  humidity: "${data!.humidity}",
                  feelsLike: "${data!.feelsLike}",
                )
              ],
            );
          } else {
            return Text(
                "No se encontraron datos para esta ciudad."); // Mensaje de error si no hay datos
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child:
                CircularProgressIndicator(), // Indicador de carga mientras se espera la respuesta de la API
          );
        } else if (snapshot.hasError) {
          return Text(
              "Error: ${snapshot.error}"); // Mensaje de error si hay un error en la solicitud
        }
        return Container();
      },
    );
  }

  Future<void> getData(String location) async {
    if (location.isNotEmpty) {
      // Asegurarse de que la ubicación no esté vacía antes de realizar la solicitud
      WeatherModel weatherData = await weatherapi.getCurrentWeather(location);
      setState(() {
        data = weatherData;
      });
    }
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }
}
