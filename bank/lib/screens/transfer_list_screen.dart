import 'package:bank/models/transfer.dart';
import 'package:bank/screens/transfer_form_screen.dart';
import 'package:bank/widgets/transfer_item.dart';
import 'package:flutter/material.dart';

class TransferListScreen extends StatefulWidget {
  final List<Transfer> _list = List();

  @override
  _TransferListScreen createState() => _TransferListScreen();
}

class _TransferListScreen extends State<TransferListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transferências"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferFormScreen();
          })).then((transferReceived) {
            if (transferReceived != null) {
              setState(() {
                widget._list.add(transferReceived);
              });
            }
          });
        },
      ),
      body: ListView.builder(
        itemCount: widget._list.length,
        itemBuilder: (context, index) {
          final transfer = widget._list[index];
          return TransferItem(transfer);
        },
      ),
    );
  }
}