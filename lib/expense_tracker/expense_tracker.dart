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
      isScrollControlled: true,
      builder: (ctx) => NewExpense(
        closeExpenseOverlay: _closeExpenseOverlay,
        addExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _insertExpense(int index, Expense expense) {
    setState(() {
      _registeredExpenses.insert(index, expense);
    });
  }

  void _showSnakbar(int index, Expense expense) {
    // Clear already present snackbars
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense removed!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            _insertExpense(index, expense);
          },
        ),
      ),
    );
  }

  void _removeExpense(Expense expense) {
    final index = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    _showSnakbar(index, expense);
  }

  void _closeExpenseOverlay() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expense found, please add some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onDismissed: _removeExpense,
      );
    }

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
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
