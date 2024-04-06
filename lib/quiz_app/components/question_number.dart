import 'package:flutter/material.dart';
import 'package:second_app/quiz_app/models/question_summary.dart';

class QuestionNumber extends StatelessWidget {
  final QuestionSummary questionSummary;
  const QuestionNumber({super.key, required this.questionSummary});

  @override
  Widget build(BuildContext context) {
    Color getChipColor(QuestionSummary summary) {
      Color chipColor = const Color.fromARGB(255, 222, 92, 54);
      if (summary.isCorrect) {
        chipColor = const Color.fromARGB(255, 164, 90, 206);
      }
      return chipColor;
    }

    return Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: getChipColor(questionSummary),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          (questionSummary.questionIndex + 1).toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
