import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sayoraaa/services/supabase_auth_service.dart';
import 'signup_screen.dart';
import 'MainNavigationScreen.dart';
import 'package:sayoraaa/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final auth = Provider.of<AuthProvider>(context, listen: false);
    final response = await auth.login(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    setState(() {
      _isLoading = false;
    });

    if (response != null && auth.isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigationScreen(initialIndex: 0),
        ),
      );
    } else {
      setState(() {
        _errorMessage = "Invalid email or password.";
      });
    }
  }

  Future<void> _handleGoogleLogin() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final auth = Provider.of<AuthProvider>(context, listen: false);
    try {
      await auth.signInWithGoogle();
      if (auth.isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const MainNavigationScreen(initialIndex: 0),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Google login failed: $e";
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _handleFacebookLogin() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final auth = Provider.of<AuthProvider>(context, listen: false);
    try {
      await auth.signInWithFacebook();
      if (auth.isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const MainNavigationScreen(initialIndex: 0),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Facebook login failed: $e";
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _handleAppleLogin() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final auth = Provider.of<AuthProvider>(context, listen: false);
    try {
      await auth.signInWithApple();
      if (auth.isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const MainNavigationScreen(initialIndex: 0),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Apple login failed: $e";
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

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
                    Color.fromRGBO(34, 3, 136, 0.844),
                    Color.fromRGBO(208, 195, 252, 1)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              top: 60,
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
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.12),
                      offset: Offset(0, -30),
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(180, 170, 232, 0.826),
                      offset: Offset(0, -20),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Enter Email Address",
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                          decoration: _inputDecoration("email@example.com"),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Enter Password",
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                          decoration: _inputDecoration("Enter your password"),
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
                        if (_errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              _errorMessage!,
                              style: const TextStyle(color: Colors.red, fontSize: 13),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.zero,
                              backgroundColor: const Color(0xFF734AD0),
                            ),
                            child: _isLoading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : Ink(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 34, 3, 136),
                                          Color.fromARGB(211, 208, 195, 252),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
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
                          children: [
                            const Expanded(child: Divider()),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: _socialButton('assets/icons/fb.svg', _handleFacebookLogin),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: _socialButton('assets/icons/google.svg', _handleGoogleLogin),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: _socialButton('assets/icons/apple.svg', _handleAppleLogin),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account? ",
                              style: GoogleFonts.lato(fontSize: 13),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromRGBO(67, 125, 206, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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

  Widget _socialButton(String iconPath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
