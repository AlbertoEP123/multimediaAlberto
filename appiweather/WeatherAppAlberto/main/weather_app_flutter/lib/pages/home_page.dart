import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//
import '../utils/constanst.dart';
import '../model/weather_model.dart';
import '../services/weather_api_client.dart';
import '../widget/current_weather.dart';
import '../widget/more_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  WeatherApiClient weatherapi = WeatherApiClient();
  WeatherModel? data;
  TextEditingController _cityController = TextEditingController(); // Nuevo

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.darken),
              filterQuality: FilterQuality.high,
              image: AssetImage("assets/images/backG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          width: w,
          height: h,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              // Nuevo
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
                          loadedData();
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
      ),
    );
  }

  FutureBuilder<void> loadedData() {
    return FutureBuilder(
      future: getData(_cityController.text),
      builder: (ctx, snp) {
        if (snp.connectionState == ConnectionState.done) {
          if (data != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                currentWeather(
                  onPressed: () {
                    setState(() {
                      loadedData();
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
            return Container(); // Retorna un widget vacío si data es nulo
          }
        } else if (snp.connectionState == ConnectionState.waiting) {
          return Center(
            child: CupertinoActivityIndicator(
              radius: 20,
              color: Color.fromARGB(255, 172, 216, 247),
            ),
          );
        }
        return Container();
      },
    );
  }

  Future<void> getData(String? location) async {
    WeatherModel weatherData = await weatherapi.getCurrentWeather(location);
    setState(() {
      data = weatherData;
    });
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }
}
