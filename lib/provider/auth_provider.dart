import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

class SupabaseAuthService {
  final _client = Supabase.instance.client;

  /// Email + password login
  Future<AuthResponse> login(String email, String password) async {
    return await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  /// Email + password signup
  Future<AuthResponse> signUp(String email, String password) async {
    return await _client.auth.signUp(
      email: email,
      password: password,
    );
  }

  /// OAuth login (Google)
  Future<void> loginWithGoogle() async {
    await _client.auth.signInWithOAuth(OAuthProvider.google);
  }

  /// Logout
  Future<void> logout() async {
    await _client.auth.signOut();
  }

  /// Current user
  User? get currentUser => _client.auth.currentUser;
}
