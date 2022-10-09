import 'dart:math';

import 'package:expense_tracker/models/budget.dart';
import 'package:expense_tracker/models/budgetExpense.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/providers/budget-expense-provider.dart';
import 'package:expense_tracker/providers/budgets-provider.dart';
import 'package:expense_tracker/providers/transactions-provider.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AddExpenseDialog extends StatefulWidget {
  AddExpenseDialog({Key? key}) : super(key: key);

  @override
  _AddExpenseDialogState createState() => _AddExpenseDialogState();
}

class _AddExpenseDialogState extends State<AddExpenseDialog> {
  final amountController = TextEditingController();
  Budget dropdownvalue = Budget(0, "", 0.0, 0.0);

  void _addBudgetTransaction(BuildContext context) {
    int id = 00 + Random().nextInt(500);
    String budgetCategory = "${dropdownvalue.category} (Budget Transaction)";
    int budgetId = dropdownvalue.id;
    double amount = double.parse(amountController.text);
    int amountInt = int.parse(amountController.text);
    BudgetExpense expense = new BudgetExpense(id, amount, budgetId);
    Transaction transaction = new Transaction(id, budgetCategory, amountInt);
    context.read<BudgetExpenseProvider>().addBudgetExpense(expense);
    context.read<TransactionProvider>().addTransaction(transaction);
    context.read<BudgetProvider>().updateBudgetSpend(amount, budgetId);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      dropdownvalue = context.read<BudgetProvider>().getBudgetList[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
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
                "Budget Expense",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Budget",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: 50,
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Budget>(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: context
                        .read<BudgetProvider>()
                        .getBudgetList
                        .map((Budget item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item.category),
                      );
                    }).toList(),
                    onChanged: (Budget? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "Budget Spending Amount",
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
                    hintText: 'Enter Budget Spending Amount',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () => _addBudgetTransaction(context),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: const Text('Create Budget Expense'),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepPurpleAccent),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
