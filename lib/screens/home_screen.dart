import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sayoraaa/screens/chat_screen.dart';
import 'package:sayoraaa/services/circular_progress.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 34, 3, 136),
                Color.fromARGB(210, 144, 128, 199),
              ],
            ),
          ),
          child: Column(
            children: [
              _buildTopHeader(),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.12),
                      // blurRadius: 25,
                      spreadRadius: 0,
                      offset: Offset(0, -30),
                    ),
                    // BoxShadow(
                    //   color: Color.fromRGBO(110, 84, 198, 1),
                    //   // blurRadius: 20,
                    //   spreadRadius: 10,
                    //   offset: Offset(0, -15),
                    // ),
                    BoxShadow(
                      color: Color.fromRGBO(180, 170, 232, 0.826),
                      // blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset(0, -20),
                    ),
                  ],
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        _statCardRow(),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              "Let's power up your XP! ",
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/icons/star (1).svg',
                              color: const Color.fromARGB(255, 118, 72, 209),
                              theme: SvgTheme(currentColor: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildQuestCard(context),
                        const SizedBox(height: 16),
                        _buildLevelCard(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 50),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            // alignment: AlignmentDirectional.bottomEnd,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFFE0D7F8),
                  backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-psd/3d-rendering-hair-style-avatar-design_23-2151869121.jpg',
                  ),
                  radius: 22,
                ),
                // const SizedBox(height: 8),
                Text(
                  "Hey Elizabeth Latte!",
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // const SizedBox(height: 2/\),
                Text(
                  "Welcome back! Ready to learn today?",
                  style: GoogleFonts.lato(fontSize: 10, color: Colors.white),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: const Color.fromRGBO(139, 109, 212, 1),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/flash (1).svg',
                        color: const Color.fromARGB(255, 118, 72, 209),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        "Streak ",
                        style: GoogleFonts.lato(
                          color: Colors.deepPurple,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "432",
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.notifications_none,
                    color: Color.fromRGBO(108, 65, 250, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCardRow() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF3EEFD),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _singleStat(
            titlePart1: "432",
            titlePart2: " Rank",
            subtitle: "45th position",
            svgAssetPath: 'assets/icons/flash (1).svg',
          ),
          _singleStat(
            titlePart1: "2345",
            titlePart2: " Xp",
            subtitle: "Top among 456!",
            svgAssetPath: 'assets/icons/star (1).svg',
          ),
        ],
      ),
    );
  }

  Widget _singleStat({
    required String titlePart1,
    required String titlePart2,
    required String subtitle,
    required String svgAssetPath,
  }) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 96, 69, 185),
                Color.fromARGB(210, 166, 158, 221),
              ],
            ),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            svgAssetPath,
            width: 25,
            height: 25,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: titlePart1,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: titlePart2,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.lato(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  
  Widget _buildQuestCard(BuildContext context) {
    return Container(
      width: double.infinity,
      
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F0FE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Today's Quest",
          //   style: GoogleFonts.lato(
          //     fontSize: 14,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.black,
          //   ),
          // ),
          // const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          "Today's Quest",
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(171, 255, 226, 39),
                                Color.fromRGBO(255, 154, 30, 0.963),
                              ],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/mstar.svg',
                                width: 40,
                                height: 30,
                                // color: Colors.white,
                                theme: SvgTheme(
                                  currentColor: Colors.white,
                                  
                                ),
                              ),
                              Text(
                                "Level-1",
                                style: GoogleFonts.lato(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Level 1 - Introduction",
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Level 1 unlocked - 99 more to conquer!",
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Complete it to earn XP and unlock rewards!",
                      style: GoogleFonts.lato(
                        fontSize: 11,
                        color: Colors.deepPurple[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(83, 48, 196, 1),
                  Color.fromARGB(255, 114, 98, 170),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size.fromHeight(40),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()),
                );
              },
              child: Text(
                "Get Started on Level - 1",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1EDFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedCircularProgress(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Level 1",
                      style: GoogleFonts.lato(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "1 of 100",
                      style: GoogleFonts.lato(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Level 1",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Let the journey begin! Earn XP, beat challenges, and level up fast.",
                  style: GoogleFonts.lato(fontSize: 12, color: Colors.black87),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Previous",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 60),
                    Row(
                      children: [
                        Text(
                          "Next",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            color: Color(0xFF4B22B4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Color(0xFF4B22B4),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
