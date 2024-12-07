import 'package:flutter/material.dart';

class HabitDetailSection extends StatelessWidget {
  final String quote;
  final String author;

  const HabitDetailSection({
    super.key,
    required this.quote,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Daily Quote',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            '"$quote"',
            style: const TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 10),
          Text(
            '- $author',
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
