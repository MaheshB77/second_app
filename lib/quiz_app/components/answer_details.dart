import 'package:flutter/material.dart';
import 'package:second_app/quiz_app/components/question_number.dart';
import 'package:second_app/quiz_app/components/question_recap.dart';
import 'package:second_app/quiz_app/models/question_summary.dart';

class AnswerDetails extends StatelessWidget {
  final List<QuestionSummary> questionSummary;
  const AnswerDetails({super.key, required this.questionSummary});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: questionSummary.map((e) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionNumber(questionSummary: e),
                const SizedBox(width: 12,),
                QuestionRecap(questionSummary: e)
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
