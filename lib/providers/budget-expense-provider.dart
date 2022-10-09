import 'package:expense_tracker/models/budgetExpense.dart';
import 'package:flutter/material.dart';

class BudgetExpenseProvider with ChangeNotifier {
  List<BudgetExpense> _budgetExpenseList = [
    BudgetExpense(1, 200, 1),
    BudgetExpense(2, 100, 1),
    BudgetExpense(3, 100, 1)
  ];

  List<BudgetExpense> get getBudgetExpenseList => _budgetExpenseList;
  void addBudgetExpense(BudgetExpense expense) {
    _budgetExpenseList.add(expense);
    notifyListeners();
  }

  List<BudgetExpense> getBudgetExpenses(int budgetId) {
    List<BudgetExpense> expenselist =
        _budgetExpenseList.where((b) => b.budgetId == budgetId).toList();
    return expenselist;
  }
}
