import 'package:day2/features/user-feature/models/user-model.dart';
import 'package:day2/features/user-feature/repository/user-repository.dart';
import 'package:flutter/material.dart';

class UserController with ChangeNotifier {
  final UserRepository _userRepository;
  
  UserController(this._userRepository);
  
  List<UserModel> _allUsers = [];
  List<UserModel> _filteredUsers = [];
  bool _isLoading = false;
  String? _error;

  List<UserModel> get users => _filteredUsers;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    try {
      _allUsers = await _userRepository.fetchUsers();
      _filteredUsers = _filterUsers(_allUsers);
      _error = null;
    } catch (e) {
      _error = e.toString();
      _allUsers = [];
      _filteredUsers = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<UserModel> _filterUsers(List<UserModel> users) {
    return users.where((user) {
      return user.phone != null && user.phone!.startsWith('1');
    }).toList();
  }
}