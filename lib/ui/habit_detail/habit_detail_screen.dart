import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nitin_habit_app/bloc/habit/habit_bloc.dart';
import 'package:nitin_habit_app/bloc/habit/habit_event.dart';
import 'package:nitin_habit_app/bloc/habit/habit_state.dart';
import 'package:nitin_habit_app/ui/habit_detail/widgets/edit_habit_dialouge.dart';
import 'widgets/habit_tile.dart';

class HabitDetailScreen extends StatelessWidget {
  const HabitDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracker'),
      ),
      body: BlocBuilder<HabitBloc, HabitState>(
        builder: (context, state) {
          if (state.habits.isEmpty) {
            return const Center(child: Text('No habits added yet.'));
          }
          return ListView.builder(
            itemCount: state.habits.length,
            itemBuilder: (context, index) {
              final habit = state.habits[index];
              return HabitTile(
                title: habit.title,
                subtitle: '${habit.streak}/${habit.total}',
                onEdit: () {
                  _showEditHabitDialog(context, habit.habitId, habit.title, habit.description);
                },
                onProgressUpdate: () {
                  context.read<HabitBloc>().add(UpdateHabitProgress(habit.habitId, 1));
                },
                onDelete: () {
                  context.read<HabitBloc>().add(DeleteHabit(habit.habitId));
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddHabitDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddHabitDialog(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final goalController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AddEditHabitDialog(
        nameController: nameController,
        descriptionController: descriptionController,
        goalController: goalController,
        title: 'Add New Habit',
        onSave: () {
          if (nameController.text.isNotEmpty && goalController.text.isNotEmpty) {
            context.read<HabitBloc>().add(AddHabit(
              nameController.text,
              descriptionController.text,
              int.parse(goalController.text),
            ));
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  void _showEditHabitDialog(BuildContext context, String habitId, String currentName, String currentDescription) {
    final nameController = TextEditingController(text: currentName);
    final descriptionController = TextEditingController(text: currentDescription);

    showDialog(
      context: context,
      builder: (_) => AddEditHabitDialog(
        nameController: nameController,
        descriptionController: descriptionController,
        title: 'Edit Habit',
        onSave: () {
          context.read<HabitBloc>().add(EditHabit(
            habitId,
            habitName: nameController.text,
            habitDescription: descriptionController.text,
          ));
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
