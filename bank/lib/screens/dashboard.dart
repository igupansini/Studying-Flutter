import 'package:bank/screens/deposit_form_screen.dart';
import 'package:bank/widgets/balance_card.dart';
import 'package:flutter/material.dart';

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
            RaisedButton(
              child: Text("Depositar"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DepositFormScreen();
                }));
              },
            )
          ],
        ));
  }
}
