import 'package:btltb7/apps/routes.dart';
import 'package:btltb7/screens/home_screen.dart';
import 'package:btltb7/screens/product_screen.dart';
import 'package:btltb7/screens/user_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.users: (context) => UserScreen(),
        AppRoutes.product: (context) => ProductScreen(),
      },
    );
  }
}
