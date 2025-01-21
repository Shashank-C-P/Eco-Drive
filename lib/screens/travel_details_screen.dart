import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelDetailsScreen extends StatelessWidget {
  const TravelDetailsScreen({super.key});

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
                'Travel Details',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Enter your Daily Commute Details',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              _buildDropdown(
                label: 'Transportation Type',
                items: ['Private', 'Public', 'Shared'],
              ),
              const SizedBox(height: 15),
              _buildDropdown(
                label: 'Vehicle Type',
                items: ['Two Wheeler', 'Four Wheeler', 'Others'],
              ),
              const SizedBox(height: 15),
              _buildDropdown(
                label: 'Manufactured By',
                items: ['Honda', 'Toyota', 'Tesla', 'Others'],
              ),
              const SizedBox(height: 15),
              _buildDropdown(
                label: 'Vehicle Make',
                items: ['CB300R', 'Civic', 'Model 3', 'Others'],
              ),
              const SizedBox(height: 15),
              _buildTextField(
                hintText: '2022',
                label: 'Manufacture Year',
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
                  'Register',
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

  Widget _buildDropdown({
    required String label,
    required List<String> items,
  }) {
    String? selectedValue;
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: Colors.black87),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: GoogleFonts.poppins(color: Colors.black87),
                ),
              ))
          .toList(),
      onChanged: (value) {
        selectedValue = value;
      },
    );
  }

  Widget _buildTextField({
    required String hintText,
    required String label,
  }) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        labelStyle: GoogleFonts.poppins(color: Colors.black87),
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
