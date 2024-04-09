import 'package:flutter/material.dart';
import 'package:second_app/expense_tracker/components/expense_item.dart';
import 'package:second_app/expense_tracker/models/Expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onDismissed;
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: Theme.of(context).cardTheme.margin, 
        ),
        key: ValueKey(expenses[index]),
        child: ExpenseItem(expenses[index]),
        onDismissed: (direction) {
          onDismissed(expenses[index]);
        },
      ),
    );
  }
}
