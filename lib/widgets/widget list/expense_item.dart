import 'package:flutter/material.dart';
import 'package:third_app/model/expense_model.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(context) {
    return Card(
        child: 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: 
            Column(
              children: [
                Text(expense.title,style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Text('\$${expense.amount.toStringAsFixed(2)}',style: Theme.of(context).textTheme.titleSmall),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(categoryIcons[expense.category]),
                        const SizedBox(width: 8,),
                        Text(expense.formattedDate,style: Theme.of(context).textTheme.titleSmall),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
    );
  }
}
