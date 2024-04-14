import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  final IconData icon;
  final String description;
  const MealItemTrait({
    super.key,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 4),
        Text(
          description,
          style: const TextStyle(color: Colors.white)
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}
