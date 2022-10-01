import 'package:expense_tracker/widgets/histroy-section.dart';
import 'package:expense_tracker/widgets/income-expense-cards.dart';
import 'package:expense_tracker/widgets/new-transaction-section.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IncomeExpenseCards(),
          HistorySection(),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: NewTransactionSection(),
            ),
          )
        ],
      ),
    );
  }
}
