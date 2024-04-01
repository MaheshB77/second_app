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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.question,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          verticalSpace(20),
          ...currentQuestion.answers.map(
            (ans) => AnswerButton(
              answer: ans,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
