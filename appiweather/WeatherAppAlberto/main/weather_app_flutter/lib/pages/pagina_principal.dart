import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//
import '../model/weather_model.dart';
import '../services/weather_api_client.dart';
import '../widget/clima_actual.dart';
import '../widget/mas_informacion.dart';

class PaginaPrincipal extends StatefulWidget {
  final width;
  final height;
  PaginaPrincipal(this.width, this.height, {Key? key}) : super(key: key);

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState(width, height);
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  final width;
  final height;

  _PaginaPrincipalState(this.width, this.height);

  WeatherApiClient weatherapi = WeatherApiClient();
  WeatherModel? data;
  TextEditingController _cityController = TextEditingController();
  Future<void>? _futureData;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String cargarImagenClima(String status) {
      if (status.toLowerCase().contains('cloud')) {
        return 'assets/images/clouds.png';
      }
      if (status.toLowerCase().contains('clear')) {
        return 'assets/images/clean.png';
      } 
      if(status.toLowerCase().contains('rain')){
        return 'assets/images/weatherLluvia.jpg';
      }  
      else {
        return 'assets/images/weather.png';
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken),
              filterQuality: FilterQuality.high,
              image: AssetImage(data != null
                  ? data!.status != null
                      ? cargarImagenClima(data!.status!)
                      : 'assets/images/weather.png'
                  : 'assets/images/weather.png'),
              fit: BoxFit.cover,
            ),
          ),
          width: width,
          height: height,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          hintText: 'Escribe la ciudad',
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futureData = obtenerDatos(_cityController.text);
                        });
                      },
                      child: Text('Buscar'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                _futureData == null
                    ? Container() // Mostrar un contenedor vacío inicialmente
                    : Expanded(child: CargarDatos()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FutureBuilder<void> CargarDatos() {
    return FutureBuilder<void>(
      future: _futureData,
      builder: (ctx, snp) {
        if (snp.connectionState == ConnectionState.done) {
          if (snp.hasError) {
            return Center(
              child: Text('La ciudad escrita no existe: ${snp.error}'),
            );
          }
          if (data != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                clima_actual(
                  onPressed: () {
                    setState(() {
                      _futureData = obtenerDatos(_cityController.text);
                    });
                  },
                  temp: "${data!.temp}",
                  ciudad: "${data!.cityName}",
                  status: "${data!.status}",
                  pais: "${data!.country}",
                  width: width,
                  height: height,
                ),
                masInformacion(
                    viento: "${data!.wind} km/h🌬️",
                    humedad: "${data!.humidity}%💧",
                    sensacion: "${data!.feelsLike}ºC🌡️",
                    width: width,
                    height: height,
                    temp_min: "${data!.temp_min}", temp_max: "${data!.temp}"),
                    //temp_max: "${data!.temp_max}"),
              ],
            );
          } else {
            return Center(
              child: Text('No se encontraron datos.'),
            );
          }
        } else if (snp.connectionState == ConnectionState.waiting) {
          return Center(
            child: CupertinoActivityIndicator(
              radius: 20,
              color: Color.fromARGB(255, 172, 216, 247),
            ),
          );
        } else {
          return Container(); // Retorna un widget vacío en otros estados de conexión
        }
      },
    );
  }

  Future<void> obtenerDatos(String? location) async {
    if (location == null || location.isEmpty) {
      return;
    }
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
