import 'package:day2/features/user-feature/view/user-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day2/features/user-feature/view-model/user-provider.dart';
import 'package:day2/features/user-feature/repository/user-repository.dart';
import 'package:day2/features/user-feature/services/user-service.dart';

void main() {
  runApp(
    Provider<UserService>(
      create: (_) => UserService(),
      child: Provider<UserRepository>(
        create: (context) => UserRepository(context.read<UserService>()),
        child: ChangeNotifierProvider<UserController>(
          create: (context) => UserController(context.read<UserRepository>()),
          child: const MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User App',
      home: const UserScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}