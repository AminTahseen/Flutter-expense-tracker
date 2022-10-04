import 'package:expense_tracker/providers/budget-expense-provider.dart';
import 'package:expense_tracker/providers/budgets-provider.dart';
import 'package:expense_tracker/providers/transactions-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/Home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BudgetProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BudgetExpenseProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Home(),
    );
  }
}
