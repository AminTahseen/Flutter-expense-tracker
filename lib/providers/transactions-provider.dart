import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> _transactionList = [
    Transaction(1, "Food & Drinks", 200),
    Transaction(2, "Rent", -200),
    Transaction(3, "Transfer", 200),
    Transaction(4, "Groceries", -200)
  ];
  int _totalBill = 0;

  List<Transaction> get getTransactionList => _transactionList;
  int get getTransactionListCount => _transactionList.length;
  int get getTotalBill => _totalBill;

  void addTransaction(Transaction item) {
    _transactionList.add(item);
    notifyListeners();
    setTotalBill();
  }

  void setTotalBill() {
    int total = 0;
    _transactionList.forEach((element) {
      total += element.amount;
    });
    _totalBill = total;
    notifyListeners();
  }
}
