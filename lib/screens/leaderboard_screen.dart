import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carpool/screens/home_screen.dart';
import 'package:carpool/screens/messages_screen.dart';
import 'package:carpool/screens/settings.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F8E0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'LeaderBoard',
          style: GoogleFonts.poppins(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTab(context, 'Region', isSelected: false),
                _buildTab(context, 'National', isSelected: false),
                _buildTab(context, 'Global', isSelected: true),
                _buildTab(context, 'Friends', isSelected: false),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildScoreCard(
                          context, '99.42', 'assets/user6.jpg', 'John'),
                      _buildScoreCard(
                        context,
                        '99.76',
                        'assets/user1.jpg',
                        'Emily',
                        isCrowned: true,
                      ),
                      _buildScoreCard(
                          context, '98.56', 'assets/user3.jpg', 'Michael'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildScoreCard(
                          context, '95.45', 'assets/user2.jpg', 'Sophia'),
                      _buildScoreCard(
                          context, '94.32', 'assets/user4.jpg', 'David'),
                      _buildScoreCard(
                          context, '93.15', 'assets/user5.jpg', 'John'),
                      _buildScoreCard(
                          context, '92.00', 'assets/user8.jpg', 'Emily'),
                      _buildScoreCard(
                          context, '90.78', 'assets/user7.jpg', 'Michael'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MessagesScreen()),
            );
          } else if (index == 2) {
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildTab(BuildContext context, String title,
      {bool isSelected = false}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreCard(
      BuildContext context, String score, String imagePath, String name,
      {bool isCrowned = false}) {
    return Column(
      children: [
        if (isCrowned)
          Icon(Icons.emoji_events, color: Colors.yellow[700], size: 24),
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey[300],
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          score,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
