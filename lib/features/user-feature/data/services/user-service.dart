import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_cleanarchetucture_mvvm/features/user-feature/data/models/user-model.dart';

class UserService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<UserModel>> fetchTodos() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
        return jsonList.map((json) => UserModel.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      throw Exception('Error fetching todos: $e');
    }
  }
}