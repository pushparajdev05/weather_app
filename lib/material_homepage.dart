
import 'package:flutter/material.dart';
import 'package:weather_app/additional.dart';
import 'package:weather_app/forecast.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              onPressed: () {},
              icon: const Icon(Icons.refresh, color: Colors.white))
        ,],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        Text(
                          "300*F",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.cloud,
                          size: 70,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Rain",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(height: 25),
            Text(
              "Weather Forecast",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                    Forecast(time:"00:00",icon:Icons.cloud,temperature: "301.22"),
                    Forecast(time:"03:00",icon:Icons.sunny,temperature: "356.22"),
                    Forecast(time:"06:00",icon:Icons.cloud,temperature: "302.22"),
                    Forecast(time:"09:00",icon:Icons.sunny,temperature: "301.22"),
                    Forecast(time:"12:00",icon:Icons.cloud,temperature: "301.22"),
                ],
              ),
            ),
            SizedBox(height: 25 ,),
            Text(
              "Additional Information",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Additional(icon:Icons.water_drop,text:"Humadity",num:"91"),
                Additional(icon:Icons.air,text:"Wind Speed",num:"7.5"),
                Additional(icon:Icons.beach_access,text:"pressure",num:"1000"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
