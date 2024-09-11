import 'package:go_router/go_router.dart';
import 'package:kas_personal/screens/home_screen.dart';
import 'package:kas_personal/screens/kas_keluar_screen.dart';
import 'package:kas_personal/screens/kas_masuk_screen.dart';
import 'package:kas_personal/screens/semua_transaksi_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'root',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'kas_masuk',
          name: 'kas_masuk',
          builder: (context, state) => const KasMasukScreen(),
        ),
        GoRoute(
          path: 'kas_keluar',
          name: 'kas_keluar',
          builder: (context, state) => const KasKeluarScreen(),
        ),
        GoRoute(
          path: 'semua_transaksi',
          name: 'semua_transaksi',
          builder: (context, state) => const SemuaTransaksiScreen(),
        ),
      ],
    ),
  ],
);
