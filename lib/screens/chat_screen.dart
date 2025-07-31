import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'home_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showEmojiPicker = false;

  void _onEmojiSelected(Emoji emoji) {
    _controller.text += emoji.emoji;
  }

  void _toggleEmojiPicker() {
    if (_showEmojiPicker) {
      setState(() => _showEmojiPicker = false);
      _focusNode.requestFocus();
    } else {
      setState(() => _showEmojiPicker = true);
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(70, 46, 151, 1),
                Color.fromRGBO(137, 121, 188, 0.824),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                        children: [
                          _messageBubble(
                            isMe: false,
                            message: "Hello!",
                            time: "10:00",
                            avatar: "👩‍🦰",
                          ),
                          _messageBubble(
                            isMe: true,
                            message: "Hi there! 😊",
                            time: "10:01",
                            avatar: "🧑🏾‍🦱",
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: _showEmojiPicker ? 270 : 40,
                      left: 0,
                      right: 0,
                      child: _buildInputField(),
                    ),
                    if (_showEmojiPicker)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          height: 250,
                          child: EmojiPicker(
                            onEmojiSelected: (category, emoji) {
                              _onEmojiSelected(emoji);
                            },
                            config: const Config(
                              emojiViewConfig: EmojiViewConfig(
                                emojiSizeMax: 32,
                                backgroundColor: Color(0xFFF2F2F2),
                                columns: 7,
                              ),
                              categoryViewConfig: CategoryViewConfig(
                                indicatorColor: Colors.deepPurple,
                                iconColor: Colors.grey,
                                iconColorSelected: Colors.deepPurple,
                              ),
                              skinToneConfig: SkinToneConfig(enabled: true),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            ),
            child: const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back,
                size: 22,
                color: Color.fromRGBO(108, 65, 250, 1),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sayora',
                style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
              ),
              Row(
                children: [
                  const Icon(Icons.circle, color: Colors.green, size: 12),
                  const SizedBox(width: 6),
                  Text(
                    'Always active',
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(
                  size: 22,
                  Icons.notifications_none,
                  color: Color.fromRGBO(108, 65, 250, 1),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          const Icon(size: 25, Icons.more_vert, color: Colors.white),
        ],
      ),
    );
  }

  Widget _messageBubble({
    required bool isMe,
    required String message,
    required String time,
    required String avatar,
  }) {
    final bubbleColor = isMe
        ? const Color.fromARGB(130, 127, 121, 149)
        : const Color.fromRGBO(162, 154, 234, 0.875);

    final avatarUrl = avatar == '👩‍🦰'
        ? 'https://tse4.mm.bing.net/th/id/OIP.lvuuyIeh1t0XEQcuipw9iwHaHa?pid=Api&P=0&h=180'
        : 'https://img.freepik.com/free-psd/3d-rendering-hair-style-avatar-design_23-2151869121.jpg?semt=ais_hybrid';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe) _buildAvatar(avatarUrl),
          if (!isMe) const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: isMe
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: GoogleFonts.lato(color: Colors.white70, fontSize: 8),
                  ),
                ],
              ),
            ),
          ),
          if (isMe) const SizedBox(width: 8),
          if (isMe) _buildAvatar(avatarUrl),
        ],
      ),
    );
  }

  Widget _buildAvatar(String url) {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(150, 130, 203, 1),
      ),
      child: ClipOval(
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) =>
              const Icon(Icons.person, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: "Type message here...",
            hintStyle: GoogleFonts.lato(color: Colors.grey[600], fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            prefixIcon: GestureDetector(
              onTap: _toggleEmojiPicker,
              child: const Icon(
                Icons.emoji_emotions_outlined,
                color: Color.fromRGBO(175, 164, 212, 1),
              ),
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFEDE7F6),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.mic, color: Color(0xFF6B46C1), size: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF6B46C1), Color(0xFF9F7AEA)],
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.send, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
