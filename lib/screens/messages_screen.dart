import 'package:carpool/screens/home_screen.dart';
import 'package:carpool/screens/leaderboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDEF5E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDEF5E5),
        elevation: 0,
        title: Text(
          'Messages',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildTab('All chats', true),
                    const SizedBox(width: 10),
                    _buildTab('Personal', false),
                    const SizedBox(width: 10),
                    _buildTab('Work', false),
                    const SizedBox(width: 10),
                    _buildTab('Groups', false),
                  ],
                ),
                const Icon(Icons.search, color: Colors.black54),
              ],
            ),
          ),
          const Divider(thickness: 1, height: 1, color: Colors.black12),
          Expanded(
            child: ListView(
              children: [
                _buildChatItem(
                  imagePath: 'assets/user1.jpg',
                  name: 'John Doe',
                  message: 'Pls take a look at the images.',
                  time: '18.31',
                  unreadCount: 5,
                  isUnread: true,
                ),
                _buildChatItem(
                  imagePath: 'assets/user2.jpg',
                  name: 'Jane Smith',
                  message: 'Hello guys, we have discussed about ...',
                  time: '16.04',
                  tag: 'JOIN RIDE',
                  isUnread: false,
                ),
                _buildChatItem(
                  imagePath: 'assets/user3.jpg',
                  name: 'Lee Williamson',
                  message: 'Yes, that\'s gonna work, hopefully.',
                  time: '06.12',
                  isUnread: false,
                ),
                _buildChatItem(
                  imagePath: 'assets/user4.jpg',
                  name: 'Ronald Mccoy',
                  message: 'Thanks dude 😊',
                  time: 'Yesterday',
                  isUnread: false,
                ),
                _buildChatItem(
                  imagePath: 'assets/user5.jpg',
                  name: 'Albert Bell',
                  message: 'I\'m happy this anime has such grea...',
                  time: 'Yesterday',
                  isUnread: false,
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
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: 1,
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LeaderboardScreen()),
            );
          } else if (index == 3) {}
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

  Widget _buildTab(String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: isActive ? Colors.white : Colors.black87,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildChatItem({
    required String imagePath,
    required String name,
    required String message,
    required String time,
    int? unreadCount,
    String? tag,
    bool isUnread = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      time,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        message,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    if (tag != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          tag,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    if (unreadCount != null)
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.green,
                        child: Text(
                          unreadCount.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
