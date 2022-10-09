import 'package:flutter/material.dart';

class MainTabBar extends StatelessWidget {
  final List<Tab> tabItems;
  MainTabBar(this.tabItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: TabBar(
        indicator: BoxDecoration(
          color: Colors.black,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        tabs: tabItems,
      ),
    );
  }
}
