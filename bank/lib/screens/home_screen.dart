import 'package:bank/models/transfer.dart';
import 'package:bank/screens/transfer_form_screen.dart';
import 'package:bank/widgets/transfer_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<Transfer> _list = List();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
            if (transferReceived != null) {
              setState(() {
                widget._list.add(transferReceived);
                debugPrint("$transferReceived");
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
