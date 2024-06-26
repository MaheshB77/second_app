import 'package:flutter/material.dart';

import 'package:second_app/expense_tracker/components/chart/chart_bar.dart';
import 'package:second_app/expense_tracker/models/Expense.dart';
import 'package:second_app/expense_tracker/models/ExpenseBucket.dart';

class Chart extends StatelessWidget {
  final List<Expense> expenses;

  const Chart({super.key, required this.expenses});

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;
    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }
    return maxTotalExpense;
  }

  Color getIconColor(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return isDarkMode
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).colorScheme.primary.withOpacity(0.7);
  }

  List<Widget> getIcons(BuildContext context) {
    return buckets
        .map(
          (bucket) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Icon(
                categoryItem[bucket.category],
                color: getIconColor(context),
              ),
            ),
          ),
        )
        .toList();
  }

  double getBarHeight(ExpenseBucket bucket) {
    return bucket.totalExpenses == 0
        ? 0
        : bucket.totalExpenses / maxTotalExpense;
  }

  List<Widget> getChartBars() {
    return buckets
        .map((bucket) => ChartBar(fill: getBarHeight(bucket)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 225,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: getChartBars(),
            ),
          ),
          const SizedBox(height: 12),
          Row(children: getIcons(context))
        ],
      ),
    );
  }
}
