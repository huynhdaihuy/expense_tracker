import 'package:flutter/material.dart';
import 'package:third_app/model/expense_model.dart';
import 'package:third_app/widgets/widget%20list/expense_list.dart';
import 'package:third_app/widgets/widget%20list/new_expense.dart';
import 'package:third_app/widgets/chart/chart.dart';
class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});
  @override
  State<ExpenseScreen> createState() {
    return _ExpenseScreenState();
  }
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Expense> listExpense = [
    Expense(
        title: 'Flutter course!',
        amount: 19.99,
        category: Category.work,
        date: DateTime.now()),
    Expense(
        title: 'Go to the gym!',
        amount: 29.99,
        category: Category.leisure,
        date: DateTime.now()),
    Expense(
        title: 'KFC chicken!',
        amount: 39.99,
        category: Category.food,
        date: DateTime.now()),
  ];

  void _showModalBottom() {
    showModalBottomSheet(
      useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpend: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      listExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = listExpense.indexOf(expense);
    setState(() {
      listExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Just deleted expense'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
             setState(() {
              listExpense.insert(expenseIndex, expense);
             });
            }),
      ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker App'), actions: [
        IconButton(
          onPressed: _showModalBottom,
          icon: const Icon(Icons.add),
        )
      ]),
      body: Column(
        children: [
          Chart(expenses: listExpense),
          Expanded(
              child: ExpenseList(
            expenses: listExpense,
            removeExpense: _removeExpense,
          )),
        ],
      ),
    );
  }
}
