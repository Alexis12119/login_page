import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'controllers/auth_controller.dart';
import 'views/login_view.dart';
import 'views/home_view.dart';
import 'views/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://eyzscfnyniowwatjehuh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV5enNjZm55bmlvd3dhdGplaHVoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU4MTE4NDksImV4cCI6MjA0MTM4Nzg0OX0.7vjJL_PtOkq2rEDqAXB4yyJeYL0cgFBaDa3wefs_pPQ',
  );

  // Initialize controllers
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Supabase Auth MVC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/register', page: () => RegisterView()),
        GetPage(
          name: '/home',
          page: () => const HomeView(),
          middlewares: [AuthMiddleware()],
        ),
      ],
    );
  }
}

// Middleware for route protection
class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();
    if (!authController.isAuthenticated) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }
}
