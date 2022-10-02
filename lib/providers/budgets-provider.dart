import 'package:expense_tracker/models/budget.dart';
import 'package:flutter/cupertino.dart';

class BudgetProvider with ChangeNotifier {
  List<Budget> _budgetList = [
    Budget(1, "Food & Drinks", 500.0, 200.0),
    Budget(2, "Gifts", 600.0, 300.0),
    Budget(3, "Macbook", 10000.0, 5000.0),
  ];

  List<Budget> get getBudgetList => _budgetList;
  int get getBudgetCount => _budgetList.length;
}
