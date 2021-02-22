import 'package:bank/models/transfers.dart';
import 'package:bank/screens/transfer_list_screen.dart';
import 'package:bank/widgets/transfer_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LatestTransfers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Últimas Transferências",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Consumer<Transfers>(
          builder: (context, transfers, child) {
            final _quantity = transfers.list.length;
            final _latestTransfers = transfers.list.reversed.toList();
            int size = 2;

            if (_quantity == 0) {
              return Card(
                margin: EdgeInsets.all(32),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Nenhuma transferência recente.",
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            if (_quantity < 3) {
              size = _quantity;
            }

            return ListView.builder(
              padding: EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return TransferCard(_latestTransfers[index]);
              },
              itemCount: size,
              shrinkWrap: true,
            );
          },
        ),
        RaisedButton(
          child: Text(
            "Ver todas transferências",
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TransferListScreen();
            }));
          },
        ),
      ],
    );
  }
}
