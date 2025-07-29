import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sayoraaa/screens/home_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(34, 3, 136, 1),
              Color.fromRGBO(98, 77, 168, 0.7),
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
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40)),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                      children: [
                        _messageBubble(
                          isMe: false,
                          message:
                              "Sed Do Eiusmod Tempor Incididunt Ut Labore Et Magna Aliqua.ddddeje hen addd cheyy.",
                          time: "10:00 AM",
                          avatar: '👩‍🦰',
                        ),
                        _messageBubble(
                          isMe: true,
                          message:
                              "Lorem Ipsum Dolor Sit Amet, Consectetur Adipisicing Elit.Consectetur Adipisicing Elit?",
                          time: "10:01 AM",
                          avatar: '🧑🏾‍🦱',
                        ),
                        _messageBubble(
                          isMe: true,
                          message:
                              "Lorem Ipsum Dolor Sit Consectetur Adipisicing Elit",
                          time: "10:02 AM",
                          avatar: '🧑🏾‍🦱',
                        ),
                        _messageBubble(
                          isMe: false,
                          message: "Ut Enim Ad Minim Veniam..",
                          time: "10:03 AM",
                          avatar: '👩‍🦰',
                        ),
                        _messageBubble(
                          isMe: true,
                          message:
                              "Lorem Ipsum Adipiscing  Consectetur Adipisicing Elit",
                          time: "10:04 AM",
                          avatar: '🧑🏾‍🦱',
                        ),
                        _messageBubble(
                          isMe: false,
                          message: "Sed Do Eiusmod",
                          time: "10:05 AM",
                          avatar: '👩‍🦰',
                        ),
                        _messageBubble(
                          isMe: true,
                          message: "Ok",
                          time: "10:06 AM",
                          avatar: '🧑🏾‍🦱',
                        ),
                      ],
                    ),
                  ),

                 
                  Positioned(
                    bottom: 40,
                    left: 0,
                    right: 0,
                    child: _buildInputField(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back,
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
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
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
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.notifications_none,
              color: Color.fromRGBO(108, 65, 250, 1),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.more_vert, color: Colors.white),
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
        ? const Color.fromRGBO(162, 154, 234, 0.875)
        : const Color.fromRGBO(130, 112, 188, 1);

    final avatarUrl = avatar == '👩‍🦰'
        ? 'https://tse4.mm.bing.net/th/id/OIP.lvuuyIeh1t0XEQcuipw9iwHaHa?pid=Api&P=0&h=180'
        : 'https://img.freepik.com/free-psd/3d-rendering-hair-style-avatar-design_23-2151869121.jpg?semt=ais_hybrid';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
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
                        bottomRight: Radius.circular(0),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(0),
                      ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.4,
                    ),
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
          width: 36,
          height: 36,
          errorBuilder: (context, error, stackTrace) =>
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
            prefixIcon: const Icon(
              Icons.emoji_emotions_outlined,
              color: Color.fromRGBO(175, 164, 212, 1),
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
