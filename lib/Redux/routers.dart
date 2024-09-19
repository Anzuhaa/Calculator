import 'package:go_router/go_router.dart';

import '../Page/bangun_datar/persegi.dart';
import '../Page/bangun_datar/persegipanjang.dart';
import '../Page/bangun_datar/segitiga.dart';
import '../Page/content_list_page.dart';

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
  ],
);