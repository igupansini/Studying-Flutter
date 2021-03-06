import 'package:bank/models/balance.dart';
import 'package:bank/models/transfer.dart';
import 'package:bank/models/transfers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferFormScreen extends StatelessWidget {
  final TextEditingController _controllerBank = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Realizar Transferência"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerBank,
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                    icon: Icon(Icons.account_balance),
                    labelText: "Banco Destino",
                    hintText: "Nubank"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerValue,
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: "Valor da Transferência",
                    hintText: "500,00"),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              child: Text("Confirmar"),
              onPressed: () {
                final String bank = _controllerBank.text;
                final double value = double.tryParse(_controllerValue.text);
                final double currentBalance =
                    Provider.of<Balance>(context, listen: false).value;

                if (bank != null && value != null) {
                  if (value <= currentBalance) {
                    final newTransfer = Transfer(bank, value);
                    Provider.of<Transfers>(context, listen: false)
                        .add(newTransfer);
                    Provider.of<Balance>(context, listen: false).remove(value);
                    Navigator.pop(context);
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
