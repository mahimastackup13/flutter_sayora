import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatProvider extends ChangeNotifier {
  final SupabaseClient supabase = Supabase.instance.client;

  List<Map<String, dynamic>> messages = [];
  RealtimeChannel? _channel;

  ChatProvider() {
    _loadMessages();
    _subscribeToMessages();
  }

  /// Fetch old messages from Supabase
  Future<void> _loadMessages() async {
    final response = await supabase
        .from('messages')
        .select()
        .order('created_at', ascending: true);

    messages = List<Map<String, dynamic>>.from(response);
    notifyListeners();
  }

  /// Listen for new messages in real-time
  void _subscribeToMessages() {
    _channel = supabase.channel('public:messages');

    _channel!.onPostgresChanges(
      event: PostgresChangeEvent.insert,
      schema: 'public',
      table: 'messages',
      callback: (payload) {
        messages.add(payload.newRecord as Map<String, dynamic>);
        notifyListeners();
      },
    );

    _channel!.subscribe();
  }

  /// Send new message
  Future<void> sendMessage(String text, {String sender = "me"}) async {
    if (text.trim().isEmpty) return;

    final newMessage = {
      'sender': sender,
      'content': text,
      'created_at': DateTime.now().toIso8601String(),
    };

    await supabase.from('messages').insert(newMessage);
  }

  /// Cleanup when provider is disposed
  @override
  void dispose() {
    _channel?.unsubscribe();
    super.dispose();
  }
}
