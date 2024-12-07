import 'package:equatable/equatable.dart';
import 'package:nitin_habit_app/domain/model/habit_model.dart';

class HabitState extends Equatable {
  final List<HabitModel> habits;

  const HabitState({this.habits = const []});

  HabitState copyWith({List<HabitModel>? habits}) {
    return HabitState(habits: habits ?? this.habits);
  }

  @override
  List<Object> get props => [habits];
}
