import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<Map<String, dynamic>> fetchProduct() async {
    final res = await http.get(
      Uri.parse('$baseUrl/products/1'),
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
