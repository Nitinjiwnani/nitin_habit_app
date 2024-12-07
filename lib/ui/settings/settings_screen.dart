import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nitin_habit_app/bloc/theme/theme_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<ThemeBloc>().add(LightThemeEvent());
              },
              child: const Text('Light Theme'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<ThemeBloc>().add(DarkThemeEvent());
              },
              child: const Text('Dark Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
