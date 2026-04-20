import 'package:btltb7/data/repository/post_repository.dart';


class PostController {
  final PostRepository repo;

  PostController(this.repo);

  Future<Map<String, dynamic>> createPost(String t, String b) {
    return repo.createPost(t, b);
  }

  Future<List<dynamic>> searchPosts(String keyword) {
  return repo.searchPosts(keyword);
}

Future<List<dynamic>> fetchPosts() {
  return repo.fetchPosts();
}

Future<void> deletePost(int id) {
  return repo.deletePost(id);
}

}
