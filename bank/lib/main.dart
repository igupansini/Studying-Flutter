import 'package:bank/models/transfers.dart';
import 'package:bank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/balance.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Balance(0),
      ),
      ChangeNotifierProvider(
        create: (context) => Transfers(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue[800],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blue[800],
            textTheme: ButtonTextTheme.primary,
          )),
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
