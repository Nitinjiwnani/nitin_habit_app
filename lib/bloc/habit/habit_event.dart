import 'package:equatable/equatable.dart';

abstract class HabitEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadHabits extends HabitEvent {}

class AddHabit extends HabitEvent {
  final String habitName;
  final String habitDescription;
  final int habitGoal;

  AddHabit(this.habitName, this.habitDescription, this.habitGoal);

  @override
  List<Object> get props => [habitName, habitDescription, habitGoal];
}

class UpdateHabitProgress extends HabitEvent {
  final String habitId;
  final int increment;

  UpdateHabitProgress(this.habitId, this.increment);

  @override
  List<Object> get props => [habitId, increment];
}

class EditHabit extends HabitEvent {
  final String habitId;
  final String? habitName;
  final String? habitDescription;

  EditHabit(this.habitId, {this.habitName, this.habitDescription});

  @override
  List<Object> get props => [habitId, habitName ?? '', habitDescription ?? ''];
}

class DeleteHabit extends HabitEvent {
  final String habitId;

  DeleteHabit(this.habitId);

  @override
  List<Object> get props => [habitId];
}
