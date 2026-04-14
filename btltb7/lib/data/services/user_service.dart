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
}
