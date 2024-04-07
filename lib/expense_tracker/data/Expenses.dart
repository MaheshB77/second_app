import 'package:second_app/expense_tracker/models/Expense.dart';

final List<Expense> expenses = [
  Expense(
    title: 'Flutter course',
    amount: 499,
    date: DateTime.now(),
    category: Category.work,
  ),
  Expense(
    title: 'Movie date',
    amount: 1000,
    date: DateTime.now(),
    category: Category.leisure,
  ),
  Expense(
    title: 'Monthly groceries',
    amount: 5000,
    date: DateTime.now(),
    category: Category.food,
  ),
  Expense(
    title: 'OTT subscriptions',
    amount: 2000,
    date: DateTime.now(),
    category: Category.leisure,
  ),
];
