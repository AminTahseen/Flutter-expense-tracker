import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> _transactionList = [
    Transaction(1, "Food & Drinks", 500),
    Transaction(2, "Rent", -200),
    Transaction(3, "Transfer", 600),
    Transaction(4, "Groceries", -200)
  ];

  int get totalBalance => _transactionList.fold<int>(
      0, (int sum, Transaction item) => sum + item.amount);

  int get totalIncome => _transactionList
      .where((e) => e.amount > 0)
      .fold<int>(0, (int sum, Transaction item) => sum + item.amount);

  int get totalExpense => _transactionList
      .where((e) => e.amount < 0)
      .fold<int>(0, (int sum, Transaction item) => sum + item.amount);

  List<Transaction> get getTransactionList => _transactionList;
  int get getTransactionListCount => _transactionList.length;

  void addTransaction(Transaction item) {
    _transactionList.add(item);
    notifyListeners();
  }
}
