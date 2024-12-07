import 'package:flutter/material.dart';
import 'package:nitin_habit_app/ui/dashboard/dashboard_screen.dart';
import 'package:nitin_habit_app/ui/habit_detail/habit_detail_screen.dart';
import 'package:nitin_habit_app/ui/resources_and_tips/resources_screen.dart';
import 'package:nitin_habit_app/ui/settings/settings_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const HabitDetailScreen(),
    const ResourcesScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Habit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tips_and_updates),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        // Styling adjusted for theme
        backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
        unselectedItemColor: theme.unselectedWidgetColor,
        selectedItemColor:  theme.brightness == Brightness.dark
              ? Colors.white
              : theme.primaryColor,
        unselectedLabelStyle: TextStyle(color: theme.unselectedWidgetColor),
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          color: theme.brightness == Brightness.dark
              ? Colors.white
              : theme.primaryColor,
        ),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
