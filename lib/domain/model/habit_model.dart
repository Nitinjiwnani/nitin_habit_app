import 'package:equatable/equatable.dart';

class HabitModel extends Equatable{
  final String habitId;
  final String title;
  final String description;
  final int streak;
  final int total;

  const HabitModel(
      {required this.habitId,
      required this.title,
      required this.description,
      this.streak = 0,
      this.total = 0});
  
  HabitModel copyWith({String? habitId, String? title, String? description, int? streak, int? total}) {
    return HabitModel(
      habitId: habitId ?? this.habitId,
      title: title ?? this.title,
      description: description ?? this.description,
      streak: streak ?? this.streak,
      total: total ?? this.total,
    );
  }
  
  @override
  List<Object?> get props => [habitId, title, description, streak, total];
}
