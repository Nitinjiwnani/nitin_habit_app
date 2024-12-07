import 'package:bloc/bloc.dart';
import 'package:nitin_habit_app/bloc/habit/habit_event.dart';
import 'package:nitin_habit_app/bloc/habit/habit_state.dart';
import 'package:nitin_habit_app/domain/model/habit_model.dart';
import 'package:nitin_habit_app/utils/toast.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  HabitBloc() : super(const HabitState()) {
    on<AddHabit>(_onAddHabit);
    on<UpdateHabitProgress>(_onUpdateHabitProgress);
    on<EditHabit>(_onEditHabit);
    on<DeleteHabit>(_onDeleteHabit);
  }

  void _onAddHabit(AddHabit event, Emitter<HabitState> emit) {
    final newHabit = HabitModel(
      habitId: 'habit_${DateTime.now().millisecondsSinceEpoch}',
      title: event.habitName,
      description: event.habitDescription,
      total: event.habitGoal,
    );
    emit(state.copyWith(habits: List.from(state.habits)..add(newHabit)));
    Toast.showToast("New habit added: ${event.habitName}");
  }

  void _onUpdateHabitProgress(UpdateHabitProgress event, Emitter<HabitState> emit) {
    final updatedHabits = state.habits.map((habit) {
      if (habit.habitId == event.habitId) {
        final newStreak = habit.streak + event.increment;
        return habit.copyWith(streak: newStreak);
      }
      return habit;
    }).toList();
    emit(state.copyWith(habits: updatedHabits));
  }

  void _onEditHabit(EditHabit event, Emitter<HabitState> emit) {
    final updatedHabits = state.habits.map((habit) {
      if (habit.habitId == event.habitId) {
        return habit.copyWith(
          title: event.habitName ?? habit.title,
          description: event.habitDescription ?? habit.description,
        );
      }
      return habit;
    }).toList();
    emit(state.copyWith(habits: updatedHabits));
  }

  void _onDeleteHabit(DeleteHabit event, Emitter<HabitState> emit) {
    final updatedHabits = state.habits
        .where((habit) => habit.habitId != event.habitId)
        .toList();
    emit(state.copyWith(habits: updatedHabits));
  }
}
