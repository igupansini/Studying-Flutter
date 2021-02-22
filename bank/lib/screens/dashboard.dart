import 'package:bank/screens/deposit_form_screen.dart';
import 'package:bank/screens/transfer_form_screen.dart';
import 'package:bank/screens/transfer_list_screen.dart';
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
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Realizar depósito"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DepositFormScreen();
                    }));
                  },
                ),
                RaisedButton(
                  child: Text("Nova transferência"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TransferFormScreen();
                    }));
                  },
                ),
              ],
            ),
            RaisedButton(
              child: Text("Transferências"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TransferListScreen();
                }));
              },
            ),
          ],
        ));
  }
}
