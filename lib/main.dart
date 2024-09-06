// main.dart
// ignore_for_file: unused_import

import 'package:calculator_redux/state.dart';
import 'package:calculator_redux/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'store.dart';
import 'actions.dart';

void main() {
  final store = createStore();

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: uiDesign(),
      ),
    );
  }
}
