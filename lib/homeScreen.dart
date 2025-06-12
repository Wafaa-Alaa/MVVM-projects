import 'package:day1/provider/registe-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Consumer<RegisterProvider>(
          builder: (context, registerProvider, child) {
            final user = registerProvider.user;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user != null
                      ? 'Hello, ${user.username}'
                      : 'No user registered',
                  style: const TextStyle(fontSize: 24),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}