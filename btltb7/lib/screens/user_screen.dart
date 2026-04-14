import 'package:btltb7/controllers/user_controller.dart';
import 'package:btltb7/data/models/user.dart';
import 'package:btltb7/data/repository/user_repository.dart';
import 'package:btltb7/data/services/user_service.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  final controller = UserController(
    UserRepository(
      UserService(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: FutureBuilder<List<User>>(
        future: controller.fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final u = users[index];
              return ListTile(
                title: Text(u.name),
                subtitle: Text(u.email),
              );
            },
          );
        },
      ),
    );
  }
}
