import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_app/quiz_app/models/question_summary.dart';
import 'package:second_app/shared/widgets/spacing.dart';

class QuestionRecap extends StatelessWidget {
  final QuestionSummary questionSummary;
  const QuestionRecap({super.key, required this.questionSummary});

  Color getAnsColor(QuestionSummary questionSummary) {
    Color color = const Color.fromARGB(200, 220, 93, 93);
    if (questionSummary.isCorrect) {
      color = const Color.fromARGB(255, 88, 180, 91);
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            questionSummary.question,
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          verticalSpace(5),
          Text(
            'User ans : ${questionSummary.userAnswer}',
            style: GoogleFonts.poppins(
              color: getAnsColor(questionSummary),
            ),
          ),
          Text(
            'Correct ans : ${questionSummary.correctAnswer}',
            style: GoogleFonts.poppins(
              color: Colors.white70,
            ),
          ),
          verticalSpace(10),
          const Divider()
        ],
      ),
    );
  }
}
