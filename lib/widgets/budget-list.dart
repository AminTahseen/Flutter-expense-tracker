import 'package:expense_tracker/providers/budgets-provider.dart';
import 'package:expense_tracker/widgets/budget-item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class BudgetList extends StatelessWidget {
  const BudgetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Scrollbar(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: context.watch<BudgetProvider>().getBudgetCount,
          itemBuilder: (BuildContext context, int index) {
            return BudgetItem(
              context.read<BudgetProvider>().getBudgetList[index],
            );
          },
        ),
      ),
    );
  }
}
