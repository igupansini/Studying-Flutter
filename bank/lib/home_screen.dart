import 'package:bank/transfer.dart';
import 'package:bank/transfer_form_screen.dart';
import 'package:bank/transfer_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Transfer> _list = List();

  @override
  Widget build(BuildContext context) {
    
    _list.add(Transfer("Caixa", 650));
    _list.add(Transfer("Nubank", 2500));
    _list.add(Transfer("Banco do Brasil", 1200));

    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferFormScreen();
          }));
          future.then((transferReceived) {
            _list.add(transferReceived);
            debugPrint("$transferReceived");
          });
        },
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          final transfer = _list[index];
          return TransferItem(transfer);
        },
      ),
    );
  }
}
