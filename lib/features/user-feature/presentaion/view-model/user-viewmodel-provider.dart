import 'package:flutter/material.dart';
import 'package:todo_cleanarchetucture_mvvm/features/user-feature/data/models/user-model.dart';
import 'package:todo_cleanarchetucture_mvvm/features/user-feature/data/repository/user-repository.dart';
import 'package:todo_cleanarchetucture_mvvm/features/user-feature/usecases/user-filter-usecase.dart';


class UserViewModelProvider extends ChangeNotifier {
  final UserFilterUseCase userFilterUseCase;
  final UserRepository userRepository ;
  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  UserViewModelProvider({required this.userFilterUseCase, required this.userRepository});

  Future<void> fetchFilteredUsers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final usersList = await userRepository.getUsers();
      _users = userFilterUseCase.filterUsersById(usersList, 1);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}