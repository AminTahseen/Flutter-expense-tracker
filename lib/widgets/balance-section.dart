import 'package:expense_tracker/providers/transactions-provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "YOUR BALANCE",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'PKR ${context.watch<TransactionProvider>().totalBalance.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
            style: TextStyle(
                color: context.watch<TransactionProvider>().totalBalance > 0
                    ? Colors.green
                    : Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
