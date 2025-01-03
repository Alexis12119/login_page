import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final _supabase = Supabase.instance.client;

  Future<Map<String, dynamic>?> signIn(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response.user?.toJson();
    } on AuthException catch (e) {
      print('Sign In Error: ${e.message}');
      return null;
    }
  }

  Future<Map<String, dynamic>?> signUp(String email, String password) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      return response.user?.toJson();
    } on AuthException catch (e) {
      print('Sign Up Error: ${e.message}');
      return null;
    }
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  bool get isAuthenticated => _supabase.auth.currentUser != null;
}
