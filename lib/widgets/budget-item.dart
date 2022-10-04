import 'package:expense_tracker/models/budget.dart';
import 'package:expense_tracker/utils/helper.dart';
import 'package:expense_tracker/widgets/progress-bar.dart';
import 'package:flutter/material.dart';

class BudgetItem extends StatelessWidget {
  final Budget _budget;
  const BudgetItem(this._budget);

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
                        'PKR ${Helper().getFormattedAmount(_budget.budgetSpend.toString())} '),
                    Text(
                      '/PKR ${Helper().getFormattedAmount(_budget.budgetMax.toString())}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
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
