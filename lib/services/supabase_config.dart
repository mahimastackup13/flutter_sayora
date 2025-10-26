import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:flutter/material.dart';

class SupabaseConfig {
  static const String supabaseUrl = 'https://kafpdcsjzkkfeqyguhcb.supabase.co'; 
  static const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImthZnBkY3NqemtrZmVxeWd1aGNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY1NDI4MTYsImV4cCI6MjA2MjExODgxNn0.bgvj5GSbS0RKfZSH2KBqpqOLPZC1UrbMtQ3Q8Z2A0tA'; 

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}
