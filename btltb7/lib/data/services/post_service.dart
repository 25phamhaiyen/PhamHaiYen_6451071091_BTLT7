import 'dart:convert';
import 'package:http/http.dart' as http;

class PostService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<Map<String, dynamic>> createPost(String title, String body) async {
    final res = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'title': title,
        'body': body,
        'userId': 1,
      }),
    );

    if (res.statusCode != 201) {
      throw Exception('HTTP ${res.statusCode}');
    }

    return jsonDecode(res.body);
  }

  Future<void> deletePost(int id) async {
  final res = await http.delete(
    Uri.parse('$baseUrl/posts/$id'),
  );

  if (res.statusCode != 200) {
    throw Exception('Delete failed');
  }
}


Future<List<dynamic>> searchPosts(String keyword) async {
  final res = await http.get(
    Uri.parse('$baseUrl/posts?q=$keyword'),
  );

  if (res.statusCode != 200) {
    throw Exception('HTTP ${res.statusCode}');
  }

  return jsonDecode(res.body);
}

Future<List<dynamic>> fetchPosts() async {
  final res = await http.get(
    Uri.parse('$baseUrl/posts'),
  );

  if (res.statusCode != 200) {
    throw Exception('HTTP ${res.statusCode}');
  }

  return jsonDecode(res.body);
}


}
