import 'dart:math';

import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/providers/transactions-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTransactionSection extends StatefulWidget {
  NewTransactionSection({Key? key}) : super(key: key);

  @override
  _NewTransactionSectionState createState() => _NewTransactionSectionState();
}

class _NewTransactionSectionState extends State<NewTransactionSection> {
  final categoryController = TextEditingController();

  final amountController = TextEditingController();

  void _addTransaction(BuildContext context) {
    int id = Random().nextInt(500);
    String category = categoryController.text;
    int amount = int.parse(amountController.text);
    var obj = new Transaction(id, category, amount);
    context.read<TransactionProvider>().addTransaction(obj);
    categoryController.text = "";
    amountController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add New Transaction",
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
                  hintText: 'Enter Category Name',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Amount",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text("(Negative : Expense, Positive : Income)"),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                controller: amountController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: 'Enter Amount',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () => _addTransaction(context),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: const Text('Add Transaction'),
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
