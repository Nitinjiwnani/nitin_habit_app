import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeData.dark())) {
    on<LightThemeEvent>(onLightTheme);
    on<DarkThemeEvent>(onDarkTheme);
  }

  void onLightTheme(LightThemeEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(themeData: ThemeData.light()));
  }

  void onDarkTheme(DarkThemeEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(themeData: ThemeData.dark()));
  }
}
