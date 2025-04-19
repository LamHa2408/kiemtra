import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/User.dart';

class UserAPIService {
  static final UserAPIService instance = UserAPIService._init();
  final String baseUrl = '';

  UserAPIService._init();

  Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJSON()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return User.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }
}
