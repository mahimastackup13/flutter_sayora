// 
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Import your screens here
import 'level_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int selectedIndex = 1;

  final List<Widget> _screens = const [
    LevelScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  void _onNavTap(int index) {
    setState(() => selectedIndex = index);
  }

  Widget _buildNavItem(String assetPath, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => _onNavTap(index),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [
                    Color.fromRGBO(34, 3, 136, 1),
                    Color.fromRGBO(208, 195, 252, 1),
                  ],
                )
              : null,
          color: isSelected ? null : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          assetPath,
          width: 18,
          height: 28,
          color: isSelected
              ? Colors.white
              : const Color.fromARGB(153, 100, 86, 194),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// Main content
          IndexedStack(
            index: selectedIndex,
            children: _screens,
          ),

          /// Floating Bottom Nav Bar
          Positioned(
            left: 80,
            right: 80,
            bottom: 40, // Raises the bar slightly above the bottom edge
            child: Container(
              height: 60,
              // width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem('assets/icons/medal-star.svg', 0),
                  _buildNavItem('assets/icons/home-trend-up.svg', 1),
                  _buildNavItem('assets/icons/profile.svg', 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
