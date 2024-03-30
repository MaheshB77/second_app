import 'package:flutter/material.dart';
import 'package:second_app/dice_app/dice_roller.dart';

// We can declare constants outside the class
const Alignment startAlignment = Alignment.topCenter;
const Alignment endAlignment = Alignment.bottomCenter;
const Color startGradColor = Color.fromARGB(255, 33, 5, 49);
const Color endGradColor = Color.fromARGB(255, 165, 95, 203);

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [startGradColor, endGradColor],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller()
      ),
    );
  }
}
