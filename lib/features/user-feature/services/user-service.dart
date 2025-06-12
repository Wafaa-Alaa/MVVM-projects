import 'dart:convert';
import 'package:day2/features/user-feature/models/user-model.dart';
import 'package:http/http.dart' as http;


class UserService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Error fetching users: $e');
    }
  }
}