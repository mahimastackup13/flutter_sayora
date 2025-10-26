import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sayoraaa/screens/MainNavigationScreen.dart';
import 'package:sayoraaa/screens/login_screen.dart';
import 'package:sayoraaa/screens/home_screen.dart';
import 'package:sayoraaa/services/supabase_auth_service.dart';
import 'package:sayoraaa/provider/auth_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    setState(() => _isLoading = true);

    try {
      final user = await authProvider.signUpWithEmail(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (user != null) {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainNavigationScreen(initialIndex:  0,)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Signup failed. Try again.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(34, 3, 136, 0.844),
                Color.fromRGBO(208, 195, 252, 1),
              ],
            ),
          ),
          child: Column(
            children: [
              // 🔹 Top Logo
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(126, 109, 182, 1),
                      Color.fromRGBO(90, 55, 203, 1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/sayora.svg',
                    width: 60,
                    height: 60,
                  ),
                ),
              ),

              // 🔹 Form
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.12),
                        spreadRadius: 0,
                        offset: Offset(0, -30),
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(110, 84, 198, 1),
                        spreadRadius: 10,
                        offset: Offset(0, -15),
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(180, 170, 232, 0.826),
                        spreadRadius: 0,
                        offset: Offset(0, -20),
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
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Create Account!",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Sign up to start using Sayora.",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // First Name
                                  _label("First Name"),
                                  TextFormField(
                                    controller: _firstNameController,
                                    decoration: _inputDecoration(
                                        "Enter your first name"),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "First name is required";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 8),

                                  // Last Name
                                  _label("Last Name"),
                                  TextFormField(
                                    controller: _lastNameController,
                                    decoration:
                                        _inputDecoration("Enter your last name"),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Last name is required";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 8),

                                  // Email
                                  _label("Email Address"),
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: _inputDecoration(
                                        "email@example.com"),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Email is required";
                                      }
                                      final emailRegex = RegExp(
                                          r'^[^@]+@[^@]+\.[^@]+$');
                                      if (!emailRegex.hasMatch(value)) {
                                        return "Enter a valid email";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 8),

                                  // Password
                                  _label("Password"),
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: _inputDecoration(
                                        "Enter your password"),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Password is required";
                                      }
                                      if (value.length < 6) {
                                        return "Password must be at least 6 characters";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),

                                  // Sign Up Button
                                  SizedBox(
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: _isLoading
                                          ? null
                                          : () => _signUp(context),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        padding: EdgeInsets.zero,
                                        backgroundColor:
                                            const Color(0xFF734AD0),
                                      ),
                                      child: Ink(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(255, 34, 3, 136),
                                              Color.fromARGB(
                                                  211, 208, 195, 252),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                        child: Center(
                                          child: _isLoading
                                              ? const CircularProgressIndicator(
                                                  color: Colors.white,
                                                )
                                              : Text(
                                                  "Sign Up",
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

                                  // Already have account
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Already have an account? ",
                                        style:
                                            GoogleFonts.lato(fontSize: 13),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Log In",
                                          style: GoogleFonts.lato(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromRGBO(
                                              67,
                                              125,
                                              206,
                                              1,
                                            ),
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
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Text(
        text,
        style: GoogleFonts.lato(
          fontSize: 14,
          color: Colors.black,
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
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
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
}
