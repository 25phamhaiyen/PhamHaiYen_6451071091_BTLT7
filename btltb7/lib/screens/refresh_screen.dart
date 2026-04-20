import 'package:flutter/material.dart';
import 'package:btltb7/controllers/post_controller.dart';
import 'package:btltb7/data/repository/post_repository.dart';
import 'package:btltb7/data/services/post_service.dart';

class RefreshScreen extends StatefulWidget {
  const RefreshScreen({super.key});

  @override
  State<RefreshScreen> createState() => _RefreshScreenState();
}

class _RefreshScreenState extends State<RefreshScreen> {
  final controller = PostController(PostRepository(PostService()));

  List data = [];

  Future<void> fetchData() async {
    final res = await controller.fetchPosts();

    setState(() {
      data = res;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pull to Refresh')),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, i) {
            return ListTile(
              title: Text(data[i]['title']),
            );
          },
        ),
      ),
    );
  }
}
