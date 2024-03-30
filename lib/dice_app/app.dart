import 'package:flutter/material.dart';
import 'package:second_app/dice_app/gradient_container.dart';

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GradientContainer(),
    );
  }
}
