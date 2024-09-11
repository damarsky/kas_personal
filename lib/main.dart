import 'package:flutter/material.dart';
import 'package:kas_personal/providers/kas_provider.dart';
import 'package:kas_personal/router.dart';
import 'package:kas_personal/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => KasProvider(),
          ),
      ],
      child: const App(),
      ),
      );
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme,
      routerConfig: router,
    );
  }
}
