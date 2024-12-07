part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;

  const ThemeState(this.themeData);

  ThemeState copyWith({ThemeData? themeData}) {
    return ThemeState(themeData ?? this.themeData);
  }

  @override
  List<Object?> get props => [themeData];
}
