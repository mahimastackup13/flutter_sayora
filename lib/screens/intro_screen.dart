import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 1;

  final List<String> images = [
    'assets/images/intro.png',
    'assets/images/intro2.png',
    'assets/images/intro3.png',
  ];

  final List<String> titles = [
    "Your English Journey Starts Here",
    "Learn with Purpose,\nSpeak with Confidence",
    "Smart Lessons That Grow\nWith You.",
  ];

  final List<String> descriptions = [
    "This is English made easy fun, practical, and tailored just for you. Whether you're a beginner or brushing up, you're in the right place.",
    "Speak clearly and naturally with our interactive tools. From pronunciation to conversation practice, we help you sound like a pro — without fear or hesitation.",
    "From beginner words to advanced grammar, every lesson adapts to your needs. No pressure — just smart, supportive learning at your speed.",
  ];

  void _onDotTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFB18BFF),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(208, 195, 252, 1),
                Color.fromRGBO(120, 80, 200, 1),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Hero(
                  tag: 'logoHero',
                  child: SvgPicture.asset(
                    'assets/images/sayora.svg',
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 280,
                                height: 280,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromRGBO(208, 195, 252, 0.3),
                                      Color.fromRGBO(153, 141, 194, 0.281),
                                    ],
                                  ),
                                ),
                              ),
                              Image.asset(images[index], width: 250, height: 240),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Text(
                              titles[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                              descriptions[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                color: Colors.white70,
                                height: 1.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
        
                          if (index == 2)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40.0,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    "Let's Get Started",
                                    style: GoogleFonts.lato(
                                      color: const Color.fromRGBO(56, 28, 148, 1),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return GestureDetector(
                      onTap: () => _onDotTapped(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.white38,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
