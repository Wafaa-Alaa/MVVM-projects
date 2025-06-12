import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day2/features/user-feature/view-model/user-provider.dart';
import 'package:day2/features/user-feature/models/user-model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserController>(context, listen: false).fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Consumer<UserController>(
        builder: (context, userController, child) {
          if (userController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (userController.error != null) {
            return Center(child: Text('Error: ${userController.error}'));
          }

          if (userController.users.isEmpty) {
            return const Center(child: Text('No users found with phone numbers starting with 1'));
          }

          return ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              final user = userController.users[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.blueGrey[50],
                  child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      children: [
                      const Icon(Icons.person, color: Colors.blueAccent),
                      const SizedBox(width: 8),
                      const Text('Name: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(user.name),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                      const Icon(Icons.phone, color: Colors.green),
                      const SizedBox(width: 8),
                      const Text('Phone: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(user.phone ?? 'No phone number'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                      const Icon(Icons.email, color: Colors.redAccent),
                      const SizedBox(width: 8),
                      const Text('Email: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(user.email),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                      const Icon(Icons.language, color: Colors.deepPurple),
                      const SizedBox(width: 8),
                      const Text('Website: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(user.website ?? 'No website'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                      const Icon(Icons.business, color: Colors.orange),
                      const SizedBox(width: 8),
                      const Text('Company Name: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(user.companyName ?? 'No company'),
                      ],
                    ),
                    ],
                  ),
                  ),
                )
              );
            },
          );
        },
      ),
    );
  }
}