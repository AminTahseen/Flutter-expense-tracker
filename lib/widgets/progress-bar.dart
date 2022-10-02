import 'package:expense_tracker/utils/helper.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double _spending;
  final double _spendingMax;
  final double _spendingPercentOfTotal;

  const ProgressBar(
      this._spendingPercentOfTotal, this._spending, this._spendingMax);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      margin: const EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 200),
              color: Color.fromRGBO(220, 220, 220, 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          FractionallySizedBox(
            widthFactor: _spendingPercentOfTotal,
            child: Container(
              decoration: BoxDecoration(
                color: ((_spending / _spendingMax) * 100) >= 100.0
                    ? Colors.red
                    : Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Container(
            child: Text(
              "${Helper().removeTrailingZero(((_spending / _spendingMax) * 100).toString())}%",
              style: TextStyle(color: Colors.white),
            ),
            margin: const EdgeInsets.only(left: 50.0, top: 1.0),
          ),
        ],
      ),
    );
  }
}
