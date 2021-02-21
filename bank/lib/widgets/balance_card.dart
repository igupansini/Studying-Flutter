import 'package:bank/models/balance.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final Balance balance;

  BalanceCard(this.balance);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          balance.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
