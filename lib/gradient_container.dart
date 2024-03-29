import 'package:flutter/material.dart';
import 'package:second_app/app_text.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 33, 5, 49),
            Color.fromARGB(255, 165, 95, 203),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(
        child: AppText(
          text: 'Mahesh',
        ),
      ),
    );
  }
}
