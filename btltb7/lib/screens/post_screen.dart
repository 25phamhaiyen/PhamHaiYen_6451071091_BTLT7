import 'package:btltb7/controllers/post_controller.dart';
import 'package:btltb7/data/repository/post_repository.dart';
import 'package:btltb7/data/services/post_service.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final controller = PostController(PostRepository(PostService()));
  final titleCtrl = TextEditingController();
  final bodyCtrl = TextEditingController();

  String result = '';

  void submit() async {
    try {
      final res = await controller.createPost(
        titleCtrl.text,
        bodyCtrl.text,
      );

      setState(() {
        result = res.toString();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post created successfully')),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Post')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: 'Title')),
            TextField(controller: bodyCtrl, decoration: const InputDecoration(labelText: 'Body')),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: submit, child: const Text('Submit')),
            Text(result),
          ],
        ),
      ),
    );
  }
}
