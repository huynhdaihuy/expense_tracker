import 'package:third_app/model/expense_model.dart';


class ExpenseBucket{
  const ExpenseBucket({required this.expenses,required this.category});
  final List<Expense> expenses;
  final Category category; 

  ExpenseBucket.forCategory(List<Expense> allExpenses,this.category) 
  : expenses = allExpenses.where(
    (expense) => expense.category == category).toList();

    double get totalExpenses {
      double sum = 0;
      for (var expense in expenses) {
        sum += expense.amount;      }
      return sum;
    }
}