import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:second_app/quiz_app/models/question_summary.dart';
import 'package:second_app/shared/widgets/spacing.dart';

class AnswerDetails extends StatelessWidget {
  final List<QuestionSummary> questionSummary;
  const AnswerDetails({super.key, required this.questionSummary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: questionSummary.map((e) {
        return Row(
          children: [
            Text((e.questionIndex + 1).toString()),
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
    );
  }
}
