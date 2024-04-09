import 'package:flutter/material.dart';
import 'package:second_app/expense_tracker/models/Expense.dart';

class NewExpense extends StatefulWidget {
  final void Function() closeExpenseOverlay;
  final void Function(Expense) addExpense;
  const NewExpense({
    super.key,
    required this.closeExpenseOverlay,
    required this.addExpense,
  });

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory = Category.leisure;

  void _openDatePicker() async {
    final now = DateTime.now();
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _onCategoryChange(Category? category) {
    if (category == null) return;
    setState(() {
      _selectedCategory = category;
    });
  }

  bool _isExpenseInvalid() {
    final isTitleInvalid = _titleController.text.trim().isEmpty;
    final enteredAmount = double.tryParse(_amountController.text);
    final isAmountInvalid = enteredAmount == null || enteredAmount <= 0;
    final isInvalidDate = _selectedDate == null;
    return (isTitleInvalid || isAmountInvalid || isInvalidDate);
  }

  void _showErrorMsg() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Invalid input'),
        content: const Text(
            'Please make sure to enter valid date, title, and amount'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('Okay'),
          )
        ],
      ),
    );
  }

  void _addExpense() {
    if (_isExpenseInvalid()) {
      _showErrorMsg();
    } else {
      widget.addExpense(
        Expense(
          title: _titleController.text,
          amount: double.parse(_amountController.text),
          date: _selectedDate!,
          category: _selectedCategory!,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: _titleController,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: const InputDecoration(
                    prefixText: '₹ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Select the date'
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _openDatePicker,
                      icon: const Icon(Icons.calendar_month_outlined),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  _onCategoryChange(value);
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _addExpense,
                child: const Text('Save expense'),
              ),
              TextButton(
                onPressed: widget.closeExpenseOverlay,
                child: const Text('Cancel'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
