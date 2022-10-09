import 'package:expense_tracker/models/budget.dart';
import 'package:expense_tracker/providers/budget-expense-provider.dart';
import 'package:expense_tracker/widgets/budget-expense-item.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ViewExpensesDialog extends StatelessWidget {
  final Budget _budget;
  const ViewExpensesDialog(this._budget);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "${_budget.category} Expenses",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            child: Scrollbar(
              child: context
                          .watch<BudgetExpenseProvider>()
                          .getBudgetExpenses(_budget.id)
                          .length >
                      0
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: context
                          .watch<BudgetExpenseProvider>()
                          .getBudgetExpenses(_budget.id)
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        return BudgetExpenseItem(
                          _budget.category,
                          context
                              .read<BudgetExpenseProvider>()
                              .getBudgetExpenses(_budget.id)[index],
                        );
                      },
                    )
                  : Center(child: Text("No Expenses Found")),
            ),
          )
        ],
      ),
    );
  }
}
