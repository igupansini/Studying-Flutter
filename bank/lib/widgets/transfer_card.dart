import 'package:bank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferCard extends StatelessWidget {
  final Transfer _transfer;

  TransferCard(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transfer.bank),
      subtitle: Text(_transfer.value.toString()),
    ));
  }
}
