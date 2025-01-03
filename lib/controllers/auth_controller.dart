import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController {
  final _authService = AuthService();
  
  final Rx<UserModel?> _currentUser = Rx<UserModel?>(null);
  final RxBool _isLoading = false.obs;

  UserModel? get currentUser => _currentUser.value;
  bool get isLoading => _isLoading.value;
  bool get isAuthenticated => _currentUser.value != null;

  Future<bool> login(String email, String password) async {
    _isLoading.value = true;

    try {
      final user = await _authService.login(email, password);
      
      if (user != null) {
        _currentUser.value = user;
        _isLoading.value = false;
        return true;
      }

      _isLoading.value = false;
      return false;
    } catch (e) {
      _isLoading.value = false;
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    _isLoading.value = true;

    try {
      final user = await _authService.register(email, password);
      
      if (user != null) {
        _currentUser.value = user;
        _isLoading.value = false;
        return true;
      }

      _isLoading.value = false;
      return false;
    } catch (e) {
      _isLoading.value = false;
      return false;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    _currentUser.value = null;
  }
}
