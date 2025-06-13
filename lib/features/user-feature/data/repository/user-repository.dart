import 'dart:convert';
import 'package:todo_cleanarchetucture_mvvm/features/user-feature/data/models/user-model.dart';
import 'package:todo_cleanarchetucture_mvvm/features/user-feature/data/repository/user-cach.dart';
import 'package:todo_cleanarchetucture_mvvm/features/user-feature/data/services/user-service.dart';

class UserRepository {
  final UserService _userServices;
  final UserCache _userCache = UserCache(); 
  List<UserModel>? _cachedUsers;

  UserRepository(this._userServices);

  Future<List<UserModel>> getUsers({bool forceRefresh = false}) async {
    if (_cachedUsers != null && !forceRefresh) {
      return _cachedUsers!;
    }
    final users = await _userServices.fetchTodos() as List<UserModel>;
    _cachedUsers = users;
    final usersJson = jsonEncode(users.map((u) => u.toJson()).toList());
    await _userCache.saveData('users_cache', usersJson);

    return users;
  }

  void clearCache() {
    _cachedUsers = null;
  }
}