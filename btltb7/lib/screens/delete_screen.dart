import 'package:flutter/material.dart';
import 'package:btltb7/controllers/post_controller.dart';
import 'package:btltb7/data/repository/post_repository.dart';
import 'package:btltb7/data/services/post_service.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  final controller = PostController(PostRepository(PostService()));

  List<int> items = List.generate(10, (index) => index + 1);

  void deleteItem(int index) async {
    final id = items[index];

    await controller.deletePost(id);

    setState(() {
      items.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delete Item')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text('Item ${items[index]}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => deleteItem(index),
            ),
          );
        },
      ),
    );
  }
}
