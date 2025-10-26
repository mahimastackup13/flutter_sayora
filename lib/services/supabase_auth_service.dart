import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProvider extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;

  User? _user;
  User? get user => _user;

  bool get isLoggedIn => _user != null;

  AuthProvider() {
    // Listen to auth state changes
    _supabase.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      _user = session?.user;
      notifyListeners();
    });

    // Initialize current user if session exists
    _user = _supabase.auth.currentUser;
  }

  /// ✅ Sign up with email, password, first & last name
  /// Stores details in both Supabase Auth + "profiles" table
  Future<User?> signUpWithEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      // --- Validation ---
      if (firstName.trim().isEmpty) {
        throw Exception("First name cannot be empty");
      }
      if (lastName.trim().isEmpty) {
        throw Exception("Last name cannot be empty");
      }
      if (!email.contains("@") || !email.contains(".")) {
        throw Exception("Invalid email format");
      }
      if (password.length < 6) {
        throw Exception("Password must be at least 6 characters long");
      }

      // --- Sign up with Supabase Auth ---
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user != null) {
        // --- Store profile in "profiles" table ---
        await _supabase.from('profiles').insert({
          'id': user.id, // same as auth user id
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
        });
      }

      _user = user;
      notifyListeners();
      return user;
    } catch (e) {
      debugPrint("SignUp Error: $e");
      return null;
    }
  }

  /// Basic SignUp (without extra fields, optional)
  Future<AuthResponse?> signUp(String email, String password) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      _user = response.user;
      notifyListeners();
      return response;
    } catch (e) {
      debugPrint("SignUp Error: $e");
      return null;
    }
  }

  /// Login with email & password
  Future<AuthResponse?> login(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      _user = response.user;
      notifyListeners();
      return response;
    } catch (e) {
      debugPrint("Login Error: $e");
      return null;
    }
  }

  /// Logout
  Future<void> logout() async {
    try {
      await _supabase.auth.signOut();
      _user = null;
      notifyListeners();
    } catch (e) {
      debugPrint("Logout Error: $e");
    }
  }

  /// Refresh session (useful in SplashScreen)
  Future<void> checkAuthStatus() async {
    final session = _supabase.auth.currentSession;
    _user = session?.user;
    notifyListeners();
  }

  /// --- SOCIAL LOGIN METHODS ---
  Future<void> signInWithGoogle() async {
    try {
      await _supabase.auth.signInWithOAuth(OAuthProvider.google);
    } catch (e) {
      debugPrint("Google SignIn Error: $e");
      rethrow;
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      await _supabase.auth.signInWithOAuth(OAuthProvider.facebook);
    } catch (e) {
      debugPrint("Facebook SignIn Error: $e");
      rethrow;
    }
  }

  Future<void> signInWithApple() async {
    try {
      await _supabase.auth.signInWithOAuth(OAuthProvider.apple);
    } catch (e) {
      debugPrint("Apple SignIn Error: $e");
      rethrow;
    }
  }
}
