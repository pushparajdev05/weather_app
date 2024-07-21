import 'package:flutter/material.dart';

class Additional extends StatelessWidget {
  final IconData icon;
  final String text;
  final String num;
  const Additional({super.key, required this.icon, required this.text, required this.num});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 40),
              const SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                num,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
