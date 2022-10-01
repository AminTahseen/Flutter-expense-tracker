import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Transaction _item;
  const TransactionItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
                width: 5.0,
                color: this._item.amount > 0 ? Colors.green : Colors.red),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              this._item.category,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "PKR ${this._item.amount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
