import 'package:expense_tracker/models/budget.dart';
import 'package:expense_tracker/utils/constants.dart';
import 'package:expense_tracker/utils/helper.dart';
import 'package:expense_tracker/widgets/progress-bar.dart';
import 'package:expense_tracker/widgets/view-expenses-dialog.dart';
import 'package:expense_tracker/providers/budgets-provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class BudgetItem extends StatelessWidget {
  final Budget _budget;
  const BudgetItem(this._budget);
  void handleClick(int item, BuildContext context) {
    switch (item) {
      case 0:
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return ViewExpensesDialog(_budget);
          },
        );
        break;
      case 1:
        context.read<BudgetProvider>().deleteBudget(_budget);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _budget.category,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  children: [
                    Text(
                        '$currency ${Helper().getFormattedAmount(_budget.budgetSpend.toString())} '),
                    Text(
                      '/$currency ${Helper().getFormattedAmount(_budget.budgetMax.toString())}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    PopupMenuButton<int>(
                      onSelected: (item) => handleClick(item, context),
                      itemBuilder: (context) => [
                        PopupMenuItem<int>(
                            value: 0, child: Text('View Expenses')),
                        PopupMenuItem<int>(value: 1, child: Text('Delete')),
                      ],
                    ),
                  ],
                )
              ],
            ),
            ProgressBar(_budget.budgetSpend / _budget.budgetMax,
                _budget.budgetSpend, _budget.budgetMax),
          ],
        ),
      ),
    );
  }
}
