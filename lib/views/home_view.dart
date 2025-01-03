import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/navigation_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final navigationController = Get.put(NavigationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authController.logout();
              navigationController.navigateToLogin();
            },
          ),
        ],
      ),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome, ${authController.currentUser?.email ?? 'User'}!'),
              const SizedBox(height: 20),
              const Text('You are now logged in.'),
            ],
          );
        }),
      ),
    );
  }
}
