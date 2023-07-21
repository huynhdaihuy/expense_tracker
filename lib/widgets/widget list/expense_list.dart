import 'package:flutter/material.dart';
import 'package:third_app/model/expense_model.dart';
import 'package:third_app/widgets/widget list/expense_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses,required this.removeExpense});
  final List<Expense> expenses;
  final void Function(Expense) removeExpense;
  @override
  Widget build(context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            margin: Theme.of(context).cardTheme.margin,
          ),
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            removeExpense(expenses[index]);
          },
          child: ExpenseItem(expense: expenses[index])));
  }
}
