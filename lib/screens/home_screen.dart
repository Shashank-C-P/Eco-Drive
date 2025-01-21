import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'messages_screen.dart';
import 'leaderboard_screen.dart';
import 'payment_screen.dart';
import 'settings.dart';
import 'ride_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: HomeTab(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MessagesScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LeaderboardScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
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
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TextEditingController _searchController = TextEditingController();
  String? driverName;
  double? rideCost;
  String? destination;
  String? eta;
  bool isLoading = false;

  Map<String, String> driverPhotos = {
    'John': 'assets/user1.jpg',
    'Emily': 'assets/user3.jpg',
    'Michael': 'assets/user5.jpg',
    'Sophia': 'assets/user7.jpg',
    'David': 'assets/user2.jpg',
  };

  void _findRide() {
    setState(() {
      isLoading = true;
    });

    Timer(const Duration(seconds: 3), () {
      final random = Random();
      List<String> drivers = ['John', 'Emily', 'Michael', 'Sophia', 'David'];
      driverName = drivers[random.nextInt(drivers.length)];

      rideCost = 5 + random.nextDouble() * 200 / 2;

      double distance = (rideCost! / 10) + random.nextDouble() * 5;

      eta = "${5 + random.nextInt(20)} mins";
      destination = _searchController.text;

      setState(() {
        isLoading = false;
      });
    });
  }

  void _cancelRide() {
    setState(() {
      driverName = null;
      rideCost = null;
      destination = null;
      eta = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Where to?',
              prefixIcon: const Icon(Icons.search, color: Colors.green),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Image.asset(
                'assets/mapimage.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              const Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.location_on,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: const Color(0xFFE6F8E0),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(Icons.person,
                        size: 30, color: Colors.black87),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vamshi',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            'CO₂ Score',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '84',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: (_searchController.text.isNotEmpty && !isLoading)
                        ? _findRide
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Find Ride',
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              if (driverName != null && rideCost != null && eta != null)
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage(driverPhotos[driverName] ?? ""),
                    ),
                    Text(
                      'Destination: $destination',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Driver: $driverName',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Cost: Rs${rideCost!.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      'ETA: $eta',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Distance: ${(rideCost! / 10 + 2).toStringAsFixed(2)} km',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RideScreen(
                                    driverName: driverName!,
                                    pickupPoint: "Pickup Location",
                                    destination: destination!,
                                    cost: rideCost!,
                                    eta: eta!,
                                    driverPhoto: driverPhotos[driverName!]!,
                                    distance: (rideCost! / 10 + 2),
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: Text(
                              'Start Ride',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _cancelRide,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: Text(
                              'Cancel Ride',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
