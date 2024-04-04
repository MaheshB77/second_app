import 'package:flutter/material.dart';
import 'package:second_app/quiz_app/models/question_summary.dart';
import 'package:second_app/shared/widgets/spacing.dart';

class AnswerDetails extends StatelessWidget {
  final List<QuestionSummary> questionSummary;
  const AnswerDetails({super.key, required this.questionSummary});

  Color getChipColor(QuestionSummary summary) {
    Color chipColor;
    if (summary.isCorrect) {
      chipColor = const Color.fromARGB(255, 164, 90, 206);
    } else {
      chipColor = const Color.fromARGB(255, 222, 92, 54);
    }
    return chipColor;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: questionSummary.map((e) {
            return Row(
              verticalDirection: VerticalDirection.up,
              children: [
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: getChipColor(e),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      (e.questionIndex + 1).toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(e.question),
                      verticalSpace(5),
                      Text(e.userAnswer),
                      Text(e.correctAnswer),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
