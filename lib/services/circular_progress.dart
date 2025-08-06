import 'package:flutter/material.dart';

class AnimatedCircularProgress extends StatefulWidget {
  const AnimatedCircularProgress({super.key});

  @override
  State<AnimatedCircularProgress> createState() =>
      _AnimatedCircularProgressState();
}

class _AnimatedCircularProgressState extends State<AnimatedCircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 0.0, end: 0.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward(); 
  }

  @override
  void dispose() {
    _controller.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 150,
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return SizedBox(
              width: 90,
              height: 90,
              child: CircularProgressIndicator(
                value: _animation.value,
                strokeWidth: 10,
                backgroundColor: const Color(0xFFE0DDF9),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF4B22B4),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}