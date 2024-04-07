import 'package:flutter/material.dart';
import 'package:second_app/expense_tracker/expense_tracker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const DiceApp(),
      // home: const QuizApp(),
      home: const ExpenseTracker(),
    );
  }
}
