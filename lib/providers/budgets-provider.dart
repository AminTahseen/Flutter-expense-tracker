import 'package:expense_tracker/models/budget.dart';
import 'package:flutter/material.dart';

class BudgetProvider with ChangeNotifier {
  List<Budget> _budgetList = [
    Budget(1, "Food & Drinks", 500.0, 200.0),
    Budget(2, "Gifts", 600.0, 300.0),
    Budget(3, "Macbook", 10000.0, 5000.0),
  ];

  List<Budget> get getBudgetList => _budgetList;
  int get getBudgetCount => _budgetList.length;

  void addBudget(Budget item) {
    _budgetList.add(item);
    notifyListeners();
  }

  void updateBudgetSpend(double spendAmount, int budgetId) {
    int index = _budgetList.indexWhere((element) => element.id == budgetId);
    _budgetList[index].budgetSpend += spendAmount;
    notifyListeners();
  }

  void deleteBudget(Budget budget) {
    _budgetList.remove(budget);
    notifyListeners();
  }
}
