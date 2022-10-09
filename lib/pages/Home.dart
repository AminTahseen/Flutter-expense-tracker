import 'package:expense_tracker/widgets/tab-bar.dart';

import '../pages/Budgets.dart';
import '../pages/Insights.dart';
import '../pages/Transactions.dart';
import '../widgets/balance-section.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BalanceSection(),
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  MainTabBar(
                    const [
                      Tab(
                        text: 'Transactions',
                      ),
                      Tab(
                        text: 'Budgets',
                      ),
                      Tab(
                        text: 'Insights',
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(
                        children: [
                          Transactions(),
                          Budgets(),
                          Insights(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
