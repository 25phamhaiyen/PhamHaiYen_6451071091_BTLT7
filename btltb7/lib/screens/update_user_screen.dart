
import 'package:btltb7/controllers/user_controller.dart';
import 'package:btltb7/data/models/user.dart';
import 'package:btltb7/data/repository/user_repository.dart';
import 'package:btltb7/data/services/user_service.dart';
import 'package:flutter/material.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({super.key});

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final controller = UserController(UserRepository(UserService()));
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();

  User? updatedUser;

  void submit() async {
    final user = await controller.updateUser(
      nameCtrl.text,
      emailCtrl.text,
    );

    setState(() {
      updatedUser = user;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Update success')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update User')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Name')),
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
            ElevatedButton(onPressed: submit, child: const Text('Update')),
            if (updatedUser != null)
              Text('${updatedUser!.name} - ${updatedUser!.email}')
          ],
        ),
      ),
    );
  }
}
