import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nitin_habit_app/bloc/habit/habit_bloc.dart';
import 'package:nitin_habit_app/bloc/quotes/quotes_bloc.dart';
import 'package:nitin_habit_app/bloc/theme/theme_bloc.dart';
import 'package:nitin_habit_app/data/remote/repository/quotes_repository.dart';
import 'package:nitin_habit_app/ui/dashboard/dashboard_screen.dart';
import 'package:nitin_habit_app/ui/habit_detail/habit_detail_screen.dart';
import 'package:nitin_habit_app/ui/resources_and_tips/resources_screen.dart';
import 'package:nitin_habit_app/ui/settings/settings_screen.dart';
import 'package:nitin_habit_app/utils/bottom_navigation_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => QuotesBloc(quotesRepository: QuotesRepository())),
        BlocProvider(create: (_) => HabitBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: _router,
            title: 'My Personal Habit App',
            theme: state.themeData,
          );
        },
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const BottomNavigationBarScreen(),
    ),
    GoRoute(
      path: "/dashboard",
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: "/habit",
      builder: (context, state) => const HabitDetailScreen(),
    ),
    GoRoute(
      path: "/resources",
      builder: (context, state) => const ResourcesScreen(),
    ),
    GoRoute(
      path: "/settings",
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
