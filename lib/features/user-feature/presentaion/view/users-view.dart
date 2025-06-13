import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_cleanarchetucture_mvvm/features/user-feature/data/repository/user-repository.dart';
import 'package:todo_cleanarchetucture_mvvm/features/user-feature/data/services/user-service.dart';
import 'package:todo_cleanarchetucture_mvvm/features/user-feature/presentaion/view-model/user-viewmodel-provider.dart';
import 'package:todo_cleanarchetucture_mvvm/features/user-feature/usecases/user-filter-usecase.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserViewModelProvider>(
      create: (_) => UserViewModelProvider(userFilterUseCase: UserFilterUseCase(), userRepository: UserRepository(UserService())),
      child: Builder(
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Provider.of<UserViewModelProvider>(context, listen: false).fetchFilteredUsers();
          });
          return Scaffold(
            appBar: AppBar(
              title: const Text('Users'),
            ),
            body: Consumer<UserViewModelProvider>(
              builder: (context, userViewModel, child) {
                final users = userViewModel.users;
                if (userViewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (userViewModel.error != null) {
                  return Center(child: Text('Error: ${userViewModel.error}'));
                }
                if (users.isEmpty) {
                  return const Center(child: Text('No users found.'));
                }
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      elevation: 2,
                      child: ListTile(
                      leading: Icon(
                        user.completed ? Icons.check_circle : Icons.radio_button_unchecked,
                        color: user.completed ? Colors.green : Colors.grey,
                      ),
                      title: Text(
                        user.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        user.completed ? 'Completed' : 'Not Completed',
                        style: TextStyle(
                        color: user.completed ? Colors.green : Colors.red,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}