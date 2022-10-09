import 'package:expense_tracker/models/budgetExpense.dart';
import 'package:expense_tracker/utils/constants.dart';
import 'package:expense_tracker/utils/helper.dart';
import 'package:flutter/material.dart';

class BudgetExpenseItem extends StatelessWidget {
  final String _budgetName;
  final BudgetExpense _budgetExpense;
  const BudgetExpenseItem(this._budgetName, this._budgetExpense);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
                width: 5.0,
                color:
                    this._budgetExpense.amount > 0 ? mainAppColor : Colors.red),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_budgetName),
            Text(
              "$currency ${Helper().getFormattedAmount(_budgetExpense.amount.toString())}",
            ),
          ],
        ),
      ),
    );
  }
}
