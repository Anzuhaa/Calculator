// ignore_for_file: prefer_const_constructors, unused_import, unused_label, no_leading_underscores_for_local_identifiers

import 'package:calculator_redux/Page/Pages/bangunDatar_list_page.dart';
import 'package:calculator_redux/Page/Pages/bangunRuang_list_page.dart';
import 'package:calculator_redux/Page/aritmatika/aritmatika.dart';
import 'package:calculator_redux/Page/bangun_datar/persegi.dart';
import 'package:calculator_redux/Page/bangun_datar/persegipanjang.dart';
import 'package:calculator_redux/Page/bangun_datar/segitiga.dart';
import 'package:calculator_redux/Page/Pages/content_list_page.dart';
import 'package:calculator_redux/Page/bangun_ruang/balok.dart';
import 'package:calculator_redux/Page/bangun_ruang/kubus.dart';
import 'package:calculator_redux/Page/bangun_ruang/tabung.dart';
import 'package:calculator_redux/Page/perpangkatan/perpangkatan.dart';
import 'package:calculator_redux/Redux/reducer.dart';
import 'package:calculator_redux/Redux/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';
import 'Redux/state.dart';

void main() {
  runApp(MyApp());
}

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
      GoRoute(
        path: '/AritmatikPage',
        builder: (context, state) => MyAritmatikPage(),
      ),
      GoRoute(
        path: '/PerpangkatanPage',
        builder: (context, state) => MyPerpangkatanPage(),
      ),
      GoRoute(
        path: '/KubusPage',
        builder: (context, state) => MyKubusPage(),
      ),
      GoRoute(
        path: '/BalokPage',
        builder: (context, state) => MyBalokPage(),
      ),
      GoRoute(
        path: '/TabungPage',
        builder: (context, state) => MyTabungPage(),
      ),
      GoRoute(
        path: '/BangunDatarPage',
        builder: (context, state) => BangunDatarListPage(),
      ),
      GoRoute(
        path: '/BangunRuangPage',
        builder: (context, state) => BangunRuangListPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<StateBangunDatar>(
      store: storeBangunDatar,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}
