import 'package:flutter/material.dart';
import 'package:second_app/expense_tracker/components/expenses_list.dart';
import 'package:second_app/expense_tracker/components/new_expense.dart';
import 'package:second_app/expense_tracker/data/Expenses.dart';
import 'package:second_app/expense_tracker/models/Expense.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final List<Expense> _registeredExpenses = [...expenses];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(
        closeExpenseOverlay: _closeExpenseOverlay,
      ),
    );
  }

  void _closeExpenseOverlay() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
