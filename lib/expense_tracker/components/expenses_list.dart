import 'package:flutter/material.dart';
import 'package:second_app/expense_tracker/components/expense_item.dart';
import 'package:second_app/expense_tracker/models/Expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  const ExpensesList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
    );
  }
}
