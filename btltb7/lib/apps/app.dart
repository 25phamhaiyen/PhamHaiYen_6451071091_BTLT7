import 'package:btltb7/apps/routes.dart';
import 'package:btltb7/screens/delete_screen.dart';
import 'package:btltb7/screens/home_screen.dart';
import 'package:btltb7/screens/post_screen.dart';
import 'package:btltb7/screens/product_screen.dart';
import 'package:btltb7/screens/refresh_screen.dart';
import 'package:btltb7/screens/search_screen.dart';
import 'package:btltb7/screens/update_user_screen.dart';
import 'package:btltb7/screens/user_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      routes: {
  AppRoutes.home: (_) => const HomeScreen(),
  AppRoutes.users: (_) => UserScreen(),
  AppRoutes.product: (_) => ProductScreen(),

  AppRoutes.post: (_) => const PostScreen(),
  AppRoutes.update: (_) => const UpdateUserScreen(),
  AppRoutes.delete: (_) => const DeleteScreen(),
  AppRoutes.search: (_) => const SearchScreen(),
  AppRoutes.refresh: (_) => const RefreshScreen(),
},

    );
  }
}
