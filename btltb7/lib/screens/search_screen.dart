import 'package:flutter/material.dart';
import 'package:btltb7/controllers/post_controller.dart';
import 'package:btltb7/data/repository/post_repository.dart';
import 'package:btltb7/data/services/post_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = PostController(PostRepository(PostService()));

  List results = [];
  bool loading = false;

  void search(String keyword) async {
    setState(() => loading = true);

    try {
      final res = await controller.searchPosts(keyword);

      setState(() {
        results = res;
      });
    } catch (e) {
      print(e);
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          TextField(
            onChanged: search,
            decoration: const InputDecoration(labelText: 'Search'),
          ),
          if (loading) const CircularProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (_, i) {
                return ListTile(
                  title: Text(results[i]['title']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
