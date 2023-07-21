import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var uuid = const Uuid();
final formatter = DateFormat.yMd();

enum Category{ food, travel, leisure, work}
 
const categoryIcons = {
  Category.food : Icons.dining_sharp,
  Category.travel : Icons.travel_explore,
  Category.leisure : Icons.movie,
  Category.work : Icons.work,
};
class Expense{
  Expense({
    required this.title,
    required this.amount, 
    required this.category, 
    required this.date}): id = uuid.v4();
  
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate => formatter.format(date);
} 