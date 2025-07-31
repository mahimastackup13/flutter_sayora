
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(142, 115, 231, 0.93),
                    Color.fromRGBO(64, 29, 178, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
        
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/sayora.svg',
                  width: 60,
                  height: 60,
                ),
              ),
            ),
        
          
            Positioned(
              top: 180,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      offset: const Offset(0, -4),
                      // blurRadius: 15,
                      spreadRadius: 6,
                    ),
                  ],
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Welcome Back!",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Log in to pick up where you left off.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                "Enter Email Address",
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                decoration:
                                    _inputDecoration("email@example.com"),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Enter Password",
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                obscureText: true,
                                decoration:
                                    _inputDecoration("Enter your password"),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot your password?",
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 14),
                              Row(
                                children: [
                                  const Expanded(child: Divider()),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      "Or Login with",
                                      style: GoogleFonts.lato(fontSize: 12),
                                    ),
                                  ),
                                  const Expanded(child: Divider()),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _socialButton('assets/icons/fb.svg'),
                                  _socialButton('assets/icons/google.svg'),
                                  _socialButton('assets/icons/apple.svg'),
                                ],
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: EdgeInsets.zero,
                                    backgroundColor: const Color(0xFF734AD0),
                                  ),
                                  child: Ink(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 34, 3, 136),
                                          Color.fromARGB(211, 208, 195, 252),
                                        ],
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Get Started",
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don’t have an account? ",
                                    style: GoogleFonts.lato(fontSize: 13),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Sign Up",
                                      style: GoogleFonts.lato(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            const Color.fromRGBO(67, 125, 206, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        fontSize: 12,
        color: Color.fromRGBO(134, 133, 140, 1),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color.fromRGBO(180, 180, 180, 0.5),
          width: 0.7,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color.fromRGBO(120, 120, 120, 0.7),
          width: 1.0,
        ),
      ),
    );
  }

  Widget _socialButton(String iconPath) {
    return Container(
      width: 90,
      height: 45,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color.fromARGB(116, 133, 139, 150),
          width: 1.0,
        ),
      ),
      child: SvgPicture.asset(iconPath, width: 20, height: 20),
    );
  }
}
