import 'package:btltb7/apps/routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Practice Menu')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.users),
              child: const Text('Bài 1 - User'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.product),
              child: const Text('Bài 2 - Product'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.post),
              child: const Text('Bài 3 - Create Post'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.update),
              child: const Text('Bài 4 - Update User'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.delete),
              child: const Text('Bài 5 - Delete'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.search),
              child: const Text('Bài 6 - Search'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.refresh),
              child: const Text('Bài 7 - Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
