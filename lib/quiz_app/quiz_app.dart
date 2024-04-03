import 'package:flutter/material.dart';
import 'package:second_app/quiz_app/data/questions.dart';
import 'package:second_app/quiz_app/screens/home_screen.dart';
import 'package:second_app/quiz_app/screens/questions_screen.dart';
import 'package:second_app/quiz_app/screens/results_screen.dart';
import 'package:second_app/theme/colors.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<StatefulWidget> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Widget? currScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    currScreen = HomeScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      currScreen = QuestionsScreen(onAddAnswer: addAnswer);
    });
  }

  void addAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        currScreen = ResultsScreen(selectedAnswers: selectedAnswers);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: currScreen,
    );
  }
}
