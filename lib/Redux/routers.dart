import 'package:calculator_redux/Page/Pages/bangunDatar_list_page.dart';
import 'package:calculator_redux/Page/Pages/bangunRuang_list_page.dart';
import 'package:calculator_redux/Page/aritmatika/aritmatika.dart';
import 'package:calculator_redux/Page/bangun_ruang/balok.dart';
import 'package:calculator_redux/Page/bangun_ruang/kubus.dart';
import 'package:calculator_redux/Page/bangun_ruang/tabung.dart';
import 'package:calculator_redux/Page/perpangkatan/perpangkatan.dart';
import 'package:go_router/go_router.dart';
import '../Page/bangun_datar/persegi.dart';
import '../Page/bangun_datar/persegipanjang.dart';
import '../Page/bangun_datar/segitiga.dart';
import '../Page/Pages/content_list_page.dart';

final GoRouter router = GoRouter(
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
