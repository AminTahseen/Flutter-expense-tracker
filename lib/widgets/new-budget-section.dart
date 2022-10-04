import 'dart:math';

import 'package:expense_tracker/models/budget.dart';
import 'package:expense_tracker/providers/budgets-provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class NewBudgetSection extends StatelessWidget {
  final categoryController = TextEditingController();
  final amountController = TextEditingController();
  NewBudgetSection({Key? key}) : super(key: key);

  void _addBudget(BuildContext context) {
    int id = Random().nextInt(500);
    String category = categoryController.text;
    double amount = double.parse(amountController.text);
    Budget item = new Budget(id, category, amount, 0.0);
    context.read<BudgetProvider>().addBudget(item);
    categoryController.text = "";
    amountController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(
          top: 20.0,
          left: 10.0,
          right: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add New Budget",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.black,
            ),
            Text(
              "Category",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              height: 50,
              child: TextField(
                controller: categoryController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: 'Enter Budget Category',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Budget Amount",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                controller: amountController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: 'Enter Budget Amount',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () => _addBudget(context),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: const Text('Create Budget'),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
