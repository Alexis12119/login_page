import 'package:get/get.dart';

class NavigationController extends GetxController {
  void navigateToLogin() {
    Get.offNamed('/login');
  }

  void navigateToRegister() {
    Get.toNamed('/register');
  }

  void navigateToHome() {
    Get.offNamed('/home');
  }
}
