import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget {
  final String title;

  const HabitCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
