import 'dart:convert';

import 'package:asesmen_paud/api/base_url.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  Future<http.Response> signIn(String email, String password) async {
    final url = Uri.parse('$baseUrl/sign-in');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    return response;
  }

  Future<bool> checkToken(String token) async {
    final url = Uri.parse('$baseUrl/check-token');

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<http.Response> getProfile(String token) async {
    final url = Uri.parse('$baseUrl/profile');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}
