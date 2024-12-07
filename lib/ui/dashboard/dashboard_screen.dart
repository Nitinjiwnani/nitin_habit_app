import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nitin_habit_app/bloc/quotes/quotes_bloc.dart';
import 'package:nitin_habit_app/bloc/quotes/quotes_event.dart';
import 'package:nitin_habit_app/bloc/quotes/quotes_state.dart';
import 'package:nitin_habit_app/utils/enums.dart';
import 'package:nitin_habit_app/ui/dashboard/widgets/habit_card.dart';
import 'package:nitin_habit_app/ui/dashboard/widgets/habit_detail_section.dart';
import 'package:nitin_habit_app/ui/dashboard/widgets/progress_indicator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> habitTypes = [
    'Fitness',
    'Health',
    'Nutrition',
    'Mental Health',
    'Meditation',
    'Passion',
    'Dance',
    'Movies',
    'Fitness',
    'Health',
    'Nutrition',
    'Mental Health',
    'Meditation',
    'Passion',
    'Dance',
    'Movies',
  ];
  int totalHabitsCompleted = 0;
  int longestStreak = 0;

  @override
  void initState() {
    super.initState();
    context.read<QuotesBloc>().add(LoadQuotes());

    totalHabitsCompleted = 5; 
    longestStreak = 10;
  }

  @override
Widget build(BuildContext context) {
  final theme = Theme.of(context);
  return Scaffold(
    body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 250.0,
          pinned: true,
          backgroundColor: Colors.teal,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            centerTitle: true,
            background: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF008080), Color(0xFF004D40)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ProgressIndicatorWidget(
                    completed: totalHabitsCompleted,
                    streak: longestStreak,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<QuotesBloc, QuotesState>(
              builder: (context, state) {
                if (state.quotesStatus == QuotesStatus.success &&
                    state.quotesList.isNotEmpty) {
                  final randomQuote = state.quotesList[
                      Random().nextInt(state.quotesList.length)];
                  return HabitDetailSection(
                    quote: randomQuote.quote.toString(),
                    author: randomQuote.author.toString(),
                  );
                }
                return const Center(child: Text('No quotes available today.'));
              },
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 14.0,
            childAspectRatio: 2.5,
          ),
          delegate: SliverChildBuilderDelegate(
            childCount: habitTypes.length,
            (context, index) {
              return HabitCard(
                title: habitTypes[index],
               
              );
            },
          ),
        ),
      ],
    ),
  );
}
}