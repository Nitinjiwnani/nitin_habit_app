import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onEdit;
  final VoidCallback onProgressUpdate;
  final VoidCallback onDelete;

  const HabitTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onEdit,
    required this.onProgressUpdate,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: onEdit,
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.green),
            onPressed: onProgressUpdate,
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
