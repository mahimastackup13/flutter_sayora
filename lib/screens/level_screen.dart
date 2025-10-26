import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(34, 3, 136, 1),
                Color.fromRGBO(208, 195, 252, 1),
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 40,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFFE0D7F8),
                      backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-psd/3d-rendering-hair-style-avatar-design_23-2151869121.jpg?semt=ais_hybrid',
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Color.fromRGBO(139, 109, 212, 1),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.bolt,
                                color: Color.fromRGBO(139, 109, 212, 1),
                                size: 20,
                              ),
                              const SizedBox(width: 5),
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
                        const SizedBox(width: 10),
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
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Learning Levels",
                              style: GoogleFonts.lato(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star_border,
                                    size: 18,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    "0 / 100 Completed",
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _levelOneCard(),
                        const SizedBox(height: 20),
                        _lockedLevelCard("Level-2"),
                        const SizedBox(height: 12),
                        _lockedLevelCard("Level-3"),
                        const SizedBox(height: 12),
                        _lockedLevelCard("Level-4"),
                        const SizedBox(height: 12),
                        _lockedLevelCard("Level-5"),
                        const SizedBox(height: 12),
                        _lockedLevelCard("Level-6"),
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

  Widget _levelOneCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1EDFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Level 1 - Introduction",
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(254, 237, 74, 1),
                      Color.fromRGBO(255, 155, 30, 1),
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
                      color: Colors.white,
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
          const SizedBox(height: 6),
          Text(
            "Let the journey begin! Earn XP, beat \nchallenges, and level up fast.",
            style: GoogleFonts.lato(fontSize: 12, color: Colors.black),
          ),
          const SizedBox(height: 14),
          Text(
            "75% of 100 xp",
            style: GoogleFonts.lato(
              color: Colors.deepPurple,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          customProgressBar(progress: 0.75),
        ],
      ),
    );
  }

  Widget customProgressBar({double progress = 0.75}) {
    return Stack(
      children: [
        Container(
          height: 12,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(196, 181, 253, 0.4),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              height: 12,
              width: constraints.maxWidth * progress,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(54, 24, 126, 0.821),
                    Color(0xFFB49BF6),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            );
          },
        ),
        Positioned.fill(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              return Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _lockedLevelCard(String level) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(215, 124, 93, 198),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(241, 241, 238, 0.374),
                  Color.fromRGBO(249, 248, 246, 0.473),
                ],
              ),
              border: Border.fromBorderSide(
                BorderSide(color: Color.fromRGBO(234, 233, 236, 1), width: 1.5),
              ),
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/mstar.svg',
                  width: 30,
                  height: 26,
                  color: Colors.white,
                ),
                Text(
                  level,
                  style: GoogleFonts.lato(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Complete Previous Level to \n   unlock $level",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

