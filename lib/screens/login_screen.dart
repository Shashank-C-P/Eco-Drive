import 'package:carpool/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == 'vamshi@gmail.com' && password == 'vamshi123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      setState(() {
        _errorMessage = 'Invalid credentials. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDEF5E5),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Carpool',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Sign in to your\nAccount',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  "Don't have an account? Sign Up",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _buildTextField(
                controller: _emailController,
                hintText: 'SampleMail@gmail.com',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _passwordController,
                hintText: 'Password',
                icon: Icons.lock_outline,
                obscureText: true,
                suffixIcon: Icons.visibility_off_outlined,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Forgot Password functionality
                },
                child: Text(
                  'Forgot Your Password?',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  'Log In',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    _errorMessage,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              Text(
                'OR',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              _buildSocialButton('Sign in with Apple', 'assets/apple_logo.png'),
              const SizedBox(height: 10),
              _buildSocialButton(
                  'Sign in with Facebook', 'assets/facebook_logo.png'),
              const SizedBox(height: 10),
              _buildSocialButton(
                  'Sign in with Gmail', 'assets/google_logo.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    IconData? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.green),
        suffixIcon:
            suffixIcon != null ? Icon(suffixIcon, color: Colors.green) : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSocialButton(String text, String assetPath) {
    return ElevatedButton.icon(
      onPressed: () {
        // Social Login functionality
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(double.infinity, 50),
        side: const BorderSide(color: Colors.grey),
      ),
      icon: Image.asset(assetPath, height: 20),
      label: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );
  }
}
