import 'package:bank/models/transfer.dart';
import 'package:flutter/material.dart';

class Transfers extends ChangeNotifier {
  final List<Transfer> _list = [];

  List<Transfer> get list => _list;

  add(Transfer newTransfer) {
    list.add(newTransfer);
    notifyListeners();
  }
}
