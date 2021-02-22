import 'package:bank/models/transfers.dart';
import 'package:bank/screens/transfer_form_screen.dart';
import 'package:bank/widgets/transfer_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Transferências"),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[800],
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TransferFormScreen();
            }));
          },
        ),
        body: Consumer<Transfers>(
          builder: (context, transfers, child) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final transfer = transfers.list[index];
                return TransferCard(transfer);
              },
              itemCount: transfers.list.length,
            );
          },
        ));
  }
}
