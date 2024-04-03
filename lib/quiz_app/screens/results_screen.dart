import 'package:flutter/material.dart';
import 'package:second_app/quiz_app/components/answer_details.dart';
import 'package:second_app/quiz_app/data/questions.dart';
import 'package:second_app/quiz_app/models/question_summary.dart';
import 'package:second_app/shared/widgets/spacing.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> selectedAnswers;
  const ResultsScreen({super.key, required this.selectedAnswers});

  List<QuestionSummary> getSummary() {
    final List<QuestionSummary> questionSummary = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      questionSummary.add(QuestionSummary(
        questionIndex: i,
        question: questions[i].question,
        correctAnswer: questions[i].answers[0],
        userAnswer: selectedAnswers[i],
        isCorrect: selectedAnswers[i] == questions[i].answers[0],
      ));
    }
    return questionSummary;
  }

  int getCorrectAns() {
    var summary = getSummary();
    var correctAns = summary.where((element) => element.isCorrect);
    return correctAns.length;
  }

  @override
  Widget build(BuildContext context) {
    final int correctAns = getCorrectAns();
    final int totalQues = getSummary().length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAns out of $totalQues questions correctly!',
            ),
            verticalSpace(30),
            AnswerDetails(questionSummary: getSummary()),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
