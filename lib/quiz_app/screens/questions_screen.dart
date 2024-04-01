import 'package:flutter/material.dart';
import 'package:second_app/quiz_app/components/answer_button.dart';
import 'package:second_app/quiz_app/data/questions.dart';
import 'package:second_app/quiz_app/models/quiz_question.dart';
import 'package:second_app/shared/widgets/spacing.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final QuizQuestion currentQuestion = questions[0];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(20),
            ...currentQuestion.getShuffledAnswers().map(
              (ans) => AnswerButton(
                answer: ans,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
