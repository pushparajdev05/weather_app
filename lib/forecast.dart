import 'package:flutter/material.dart';
class Forecast extends StatelessWidget {
  final IconData icon;
  final String time;
  final String temperature;
  const Forecast({super.key, required this.icon, required this.time, required this.temperature});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                time ,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
               Icon(icon, size: 40),
              const SizedBox(height: 5),
              Text(
                temperature,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
