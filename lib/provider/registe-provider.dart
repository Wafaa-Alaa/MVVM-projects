import 'package:day1/models/user-model.dart';
import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  UserModel? _user;

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    _user = UserModel(username: username, email: email, password: password);
    notifyListeners();
  }
  UserModel? get user => _user;
}