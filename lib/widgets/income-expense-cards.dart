import 'package:expense_tracker/providers/transactions-provider.dart';
import 'package:expense_tracker/utils/constants.dart';
import 'package:expense_tracker/utils/helper.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class IncomeExpenseCards extends StatelessWidget {
  const IncomeExpenseCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Card(
              elevation: 5,
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "INCOME",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$currency ${Helper().getFormattedAmount(context.watch<TransactionProvider>().totalIncome.toString())}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: mainAppColor,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              elevation: 5,
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "EXPENSE",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$currency ${Helper().getFormattedAmount(context.watch<TransactionProvider>().totalExpense.toString())}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
