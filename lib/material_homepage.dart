import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/additional.dart';
import 'package:weather_app/forecast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getWeatherData() async {
    try {
      var res = await http.get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/forecast?q=London,uk&APPID=e1a592572e98f4679de21a98e7634358"));
      final data = jsonDecode(res.body);
      debugPrint(data.toString());
      if (data["cod"] != "200") {
        throw "Weather Data Not Found";
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh, color: Colors.white)),
        ],
      ),
      body: FutureBuilder(
          future: getWeatherData(),
          builder: (context, snapshot) {
            //chech if its in waiting state

            if (ConnectionState.waiting == snapshot.connectionState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            // error occured

            else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(child: Text(snapshot.error.toString())),
              );
            }

            final data = snapshot.data!;

            final currentWeatherData = data["list"][0];
            final currentsky = currentWeatherData["weather"][0]["main"];
            final currentTemp = currentWeatherData["main"]["temp"];
            final pressure = currentWeatherData["main"]["pressure"].toString();
            final humidity = currentWeatherData["main"]["humidity"].toString();
            final windSpeed = currentWeatherData["wind"]["speed"].toString();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              Text(
                                currentTemp.toString(),
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Icon(
                                currentsky == "Clouds" || currentsky == "Rain"
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 70,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                currentsky,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Weather Forecast",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
        
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        final hourlyForecast = data["list"][index + 1];
                        final hourlyTemp = hourlyForecast["main"]["temp"];
                        final hourlysky = hourlyForecast["weather"][0]["main"];
                        final time = DateTime.parse(hourlyForecast["dt_txt"]);
                        return Forecast(
                            time: DateFormat.j().format(time).toString(),
                            icon: hourlysky=="Clouds" || hourlysky=="Rain" ?
                                  Icons.cloud:
                                  Icons.sunny,
                            temperature: hourlyTemp.toString());
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Additional Information",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Additional(
                          icon: Icons.water_drop,
                          text: "Humidity",
                          num: humidity.toString()),
                      Additional(
                          icon: Icons.air, text: "Wind Speed", num: windSpeed.toString()),
                      Additional(
                          icon: Icons.beach_access,
                          text: "pressure",
                          num: pressure.toString()),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
