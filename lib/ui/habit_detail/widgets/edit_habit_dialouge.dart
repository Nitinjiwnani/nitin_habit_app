import 'package:flutter/material.dart';

class AddEditHabitDialog extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController? goalController; 
  final String title;
  final VoidCallback onSave;

  const AddEditHabitDialog({
    super.key,
    required this.nameController,
    required this.descriptionController,
    this.goalController,
    required this.title,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Habit Name'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          if (goalController != null)
            TextField(
              controller: goalController,
              decoration: const InputDecoration(labelText: 'Target Goal'),
              keyboardType: TextInputType.number,
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: onSave,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
