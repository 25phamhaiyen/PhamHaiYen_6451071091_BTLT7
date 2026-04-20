import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<dynamic>> fetchUsers() async {
    final uri = Uri.parse('$baseUrl/users');

    final res = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print('STATUS: ${res.statusCode}');
    print('BODY: ${res.body}');

    if (res.statusCode != 200) {
      throw Exception('HTTP ${res.statusCode}');
    }

    return jsonDecode(res.body);
  }

  Future<Map<String, dynamic>> updateUser(String name, String email) async {
  final res = await http.put(
    Uri.parse('$baseUrl/users/1'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'name': name,
      'email': email,
    }),
  );

  if (res.statusCode != 200) {
    throw Exception('HTTP ${res.statusCode}');
  }

  return jsonDecode(res.body);
}

}
