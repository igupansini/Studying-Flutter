import 'package:bank/models/balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepositFormScreen extends StatelessWidget {
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Realizar Depósito"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerValue,
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: "Valor do Depósito",
                    hintText: "500,00"),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              child: Text("Confirmar"),
              onPressed: () {
                final double value = double.tryParse(_controllerValue.text);

                if (value != null) {
                  Provider.of<Balance>(context, listen: false).add(value);
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
