import 'package:flutter/material.dart';
import 'package:second_app/shared/widgets/spacing.dart';

class HomeScreen extends StatelessWidget {
  final void Function() switchScreen;
  const HomeScreen(this.switchScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          verticalSpace(20),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          verticalSpace(20),
          FilledButton.icon(
            onPressed: switchScreen,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz!'),
          ),
        ],
      ),
    );
  }
}
