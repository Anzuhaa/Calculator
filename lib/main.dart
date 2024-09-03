import 'package:calculator_redux/store.dart';
import 'package:calculator_redux/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'state.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  

  

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Bangun datar',
        home:CalculatorScreen(),
      ),
    ); 
  }
}