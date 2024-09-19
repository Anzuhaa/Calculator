<<<<<<< HEAD
import 'package:calculator_redux/store.dart';
import 'package:calculator_redux/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'state.dart';

=======
// ignore_for_file: prefer_const_constructors, unused_import, unused_label, no_leading_underscores_for_local_identifiers

import 'package:calculator_redux/Page/bangun_datar/persegi.dart';
import 'package:calculator_redux/Page/bangun_datar/persegipanjang.dart';
import 'package:calculator_redux/Page/bangun_datar/segitiga.dart';
import 'package:calculator_redux/Page/content_list_page.dart';
import 'package:calculator_redux/Redux/reducer.dart';
import 'package:calculator_redux/Redux/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';
import 'Redux/state.dart';
>>>>>>> 09a58b9f835fff20b1739467842b3e79fc1ac665

void main() {
  runApp(MyApp());
}
<<<<<<< HEAD
class MyApp extends StatelessWidget {
  

  
=======

  final store = createStore();
class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => ContentListPage(),
      ),
      GoRoute(
        path: '/PersegiPage',
        builder: (context, state) => MyPersegiPage(),
      ),
      GoRoute(
        path: '/PersegiPanjangPage',
        builder: (context, state) => MyPersegiPanjangPage(),
      ),
      GoRoute(
        path: '/SegitigaPage',
        builder: (context, state) => MySegitigaPage(),
      ),
    ],
  );
>>>>>>> 09a58b9f835fff20b1739467842b3e79fc1ac665

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
<<<<<<< HEAD
      child: MaterialApp(
        title: 'Bangun datar',
        home:CalculatorScreen(),
      ),
    ); 
=======
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
>>>>>>> 09a58b9f835fff20b1739467842b3e79fc1ac665
  }
}