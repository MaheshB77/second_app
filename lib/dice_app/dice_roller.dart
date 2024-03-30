import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  String currentDice = 'assets/images/dice-4.png';
  Random random = Random();

  void rollDice() {
    int nextDice = random.nextInt(6) + 1;
    
    setState(() {
      currentDice = 'assets/images/dice-$nextDice.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          currentDice,
          width: 250,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: rollDice,
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 15),
          ),
          child: const Text(
            'Roll dice',
          ),
        )
      ],
    );
  }
}
