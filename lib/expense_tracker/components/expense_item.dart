import 'package:flutter/material.dart';
import 'package:second_app/expense_tracker/models/Expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem(this.expense, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Column(
          children: [
            Text(expense.title),
            Row(
              children: [
                Text('₹ ${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.ac_unit_sharp),
                    const SizedBox(width: 5),
                    Text(expense.date.toString())
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
