import 'package:expense_tracker/widgets/budget-list.dart';
import 'package:expense_tracker/widgets/budget-section.dart';
import 'package:expense_tracker/widgets/new-budget-section.dart';

import 'package:flutter/material.dart';

class Budgets extends StatelessWidget {
  const Budgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BudgetSection(),
          BudgetList(),
          NewBudgetSection(),
        ],
      ),
    );
  }
}
