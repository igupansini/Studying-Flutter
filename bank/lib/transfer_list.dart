import 'package:bank/transfer_item.dart';
import 'package:bank/transfer.dart';
import 'package:flutter/material.dart';

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransferItem(Transfer("Banco do Brasil", 50.0)),
        TransferItem(Transfer("Nubank", 550.0)),
      ],
    );
  }
}
