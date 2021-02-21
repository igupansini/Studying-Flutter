import 'package:bank/models/balance.dart';
import 'package:bank/widgets/balance_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nullbank"),
        ),
        body: ListView(
          children: [
            Align(
              child: BalanceCard(),
              alignment: Alignment.topCenter,
            ),
            Consumer<Balance>(
              builder: (context, balance, child) {
                return RaisedButton(
                  child: Text("Adicionar"),
                  onPressed: () {
                    balance.add(10);
                  },
                );
              },
            ),
          ],
        ));
  }
}
