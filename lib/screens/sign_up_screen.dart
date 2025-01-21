import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.black87),
                ),
              ),
              Text(
                'Sign up',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Already have an account? Login",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                hintText: 'Vamshi Yadav',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                hintText: 'SampleMail@gmail.com',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                hintText: '09/12/2000',
                icon: Icons.calendar_today_outlined,
                isDate: true,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                hintText: '+91 12345 67890',
                icon: Icons.phone_outlined,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                hintText: 'Password',
                icon: Icons.lock_outline,
                obscureText: true,
                suffixIcon: Icons.visibility_off_outlined,
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  'Save',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    bool isDate = false,
    IconData? suffixIcon,
  }) {
    return TextField(
      obscureText: obscureText,
      readOnly: isDate,
      onTap: () {
        if (isDate) {}
      },
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
}
