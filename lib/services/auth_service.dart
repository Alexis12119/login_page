import '../services/supabase_service.dart';
import '../models/user_model.dart';

class AuthService {
  final _supabaseService = SupabaseService();

  Future<UserModel?> login(String email, String password) async {
    final userData = await _supabaseService.signIn(email, password);
    
    if (userData != null) {
      return UserModel.fromJson(userData);
    }

    return null;
  }

  Future<UserModel?> register(String email, String password) async {
    final userData = await _supabaseService.signUp(email, password);
    
    if (userData != null) {
      return UserModel.fromJson(userData);
    }

    return null;
  }

  Future<void> logout() async {
    await _supabaseService.signOut();
  }
}
