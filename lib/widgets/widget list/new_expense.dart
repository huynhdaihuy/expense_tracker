import 'package:flutter/material.dart';
import 'package:third_app/model/expense_model.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpend});
  final void Function(Expense expense) onAddExpend;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _showDatePicker() async {
    final now = DateTime.now();
    final start = DateTime(now.year - 1, now.month, now.day);
    final last = DateTime.now();
    var valueDate = await showDatePicker(
        context: context, initialDate: now, firstDate: start, lastDate: last);
    setState(() {
      _selectedDate = valueDate;
    });
  }

  void _submitData() {
    final isInvalidAmount = double.tryParse(_amountController.text);
    final isInvalidTitle = _titleController.text.trim().isEmpty;
    if (_selectedDate == null || isInvalidAmount == null || isInvalidTitle) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          alignment: Alignment.center,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text(
                  'Try again!',
                  style: TextStyle(color: Colors.red),
                ))
          ],
          title: const Text('Invalid Input !',
              style: TextStyle(color: Colors.white)),
          content: const Text('Please try again type valid input!',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          icon: const Icon(Icons.warning),
          iconColor: Colors.white,
        ),
      );
      return;
    }
    widget.onAddExpend(Expense(
        title: _titleController.text,
        amount: double.tryParse(_amountController.text)!,
        category: _selectedCategory,
        date: _selectedDate!));
    Navigator.pop(context);
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
        padding: const EdgeInsets.fromLTRB(16,48,16,16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text('Title Expense')),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        prefixText: '\$', label: Text('Amount Expense')),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_selectedDate == null
                          ? 'No selected date !'
                          : formatter.format(_selectedDate!)),
                      IconButton(
                          onPressed: _showDatePicker,
                          icon: const Icon(Icons.calendar_month))
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase())))
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    }),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
                ElevatedButton(
                    onPressed: _submitData, child: const Text('Sumbit value!'))
              ],
            )
          ],
        ));
  }
}
