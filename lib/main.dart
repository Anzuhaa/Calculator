import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:calculator_redux/bangunruangscreen.dart';
import 'package:calculator_redux/store.dart';
import 'state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<BentukState>(
      store: store,
      child: MaterialApp(
        title: 'Kalkulator Keliling',
        home: MyBangunRuang(),
      ),
    );
  }
}

