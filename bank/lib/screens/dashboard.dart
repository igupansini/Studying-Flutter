import 'package:bank/models/balance.dart';
import 'package:bank/widgets/balance_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nullbank"),
      ),
      body: Align(
        child: BalanceCard(Balance(60)),
        alignment: Alignment.topCenter,
      ),
    );
  }
}
