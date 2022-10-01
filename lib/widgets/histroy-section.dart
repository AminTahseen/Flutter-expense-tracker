import 'package:expense_tracker/providers/transactions-provider.dart';
import 'package:expense_tracker/widgets/transaction-item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "History",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${context.watch<TransactionProvider>().getTransactionListCount} Transactions",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Scrollbar(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: context
                    .watch<TransactionProvider>()
                    .getTransactionListCount,
                itemBuilder: (BuildContext context, int index) {
                  return TransactionItem(context
                      .read<TransactionProvider>()
                      .getTransactionList[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
