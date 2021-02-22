import 'package:bank/screens/transfer_form_screen.dart';
import 'package:flutter/material.dart';

class TransferListScreen extends StatelessWidget {
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
          }));
        },
      ),
      body: Container(),
    );
  }
}
