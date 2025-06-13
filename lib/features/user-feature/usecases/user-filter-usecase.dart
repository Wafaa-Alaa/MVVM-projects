import 'package:todo_cleanarchetucture_mvvm/features/user-feature/data/models/user-model.dart';
import 'package:todo_cleanarchetucture_mvvm/features/user-feature/data/repository/user-repository.dart';

class UserFilterUseCase {

  List<UserModel> filterUsersById(List<UserModel> users, int userId) {
    return users.where((user) => user.userId == userId).toList();
  }
}
