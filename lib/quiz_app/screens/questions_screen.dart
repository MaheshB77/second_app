import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  var currentQueIndex = 0;

  nextQuestion() {
    setState(() {
      currentQueIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion currentQuestion = questions[currentQueIndex];
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
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(20),
            ...currentQuestion.getShuffledAnswers().map(
              (ans) => AnswerButton(
                answer: ans,
                onTap: nextQuestion,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
