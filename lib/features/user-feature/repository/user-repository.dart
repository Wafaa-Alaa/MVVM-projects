import 'package:day2/features/user-feature/models/user-model.dart';
import 'package:day2/features/user-feature/services/user-service.dart';

class UserRepository {
  final UserService _userService;

  UserRepository(this._userService);

  Future<List<UserModel>> fetchUsers() async {
    return await _userService.fetchUsers();
  }

}