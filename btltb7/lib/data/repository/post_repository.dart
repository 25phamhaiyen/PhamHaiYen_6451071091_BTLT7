

import 'package:btltb7/data/services/post_service.dart';

class PostRepository {
  final PostService service;

  PostRepository(this.service);

  Future<Map<String, dynamic>> createPost(String title, String body) {
    return service.createPost(title, body);
  }
  Future<List<dynamic>> searchPosts(String keyword) {
  return service.searchPosts(keyword);
}

Future<List<dynamic>> fetchPosts() {
  return service.fetchPosts();
}

Future<void> deletePost(int id) {
  return service.deletePost(id);
}

}
