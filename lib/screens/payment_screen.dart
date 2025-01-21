import 'package:flutter/material.dart';
import 'home_screen.dart';

class PaymentScreen extends StatefulWidget {
  final double cost;
  final String driverName;
  final String driverPhoto;
  final double driverRating;
  final String eta;
  final String pickupPoint;
  final String destination;
  final double distance;

  const PaymentScreen({super.key, 
    required this.cost,
    required this.driverName,
    required this.driverPhoto,
    this.driverRating = 4.5,
    required this.eta,
    required this.pickupPoint,
    required this.destination,
    required this.distance,
  });

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  double? _userRating;
  final TextEditingController _feedbackController = TextEditingController();
  bool _isFeedbackProvided = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Payment',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(widget.driverPhoto),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.driverName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            _buildStars(widget.driverRating),
                            const SizedBox(width: 5),
                            Text(
                              widget.driverRating.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildPaymentDetails(),
                const SizedBox(height: 20),
                _buildRideDetails(),
                const SizedBox(height: 20),
                const Text(
                  'Rate the Driver',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                _buildUserRatingInput(),
                const SizedBox(height: 20),
                const Text(
                  'Feedback (Optional)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _feedbackController,
                  decoration: const InputDecoration(
                    hintText: 'Provide feedback about the driver...',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  maxLines: 4,
                  onChanged: (value) {
                    setState(() {
                      _isFeedbackProvided = value.isNotEmpty;
                    });
                  },
                ),
                const SizedBox(height: 30),
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserRatingInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < (_userRating ?? 0) ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              _userRating = (index + 1).toDouble();
            });
          },
        );
      }),
    );
  }

  Widget _buildStars(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      stars.add(Icon(
        i <= rating
            ? Icons.star
            : (i - rating >= 0.5 ? Icons.star_border : Icons.star_half),
        color: Colors.amber,
        size: 20,
      ));
    }
    return Row(children: stars);
  }

  Widget _buildPaymentDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Amount: ₹${widget.cost.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildRideDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ride Details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildRideDetailRow('Pickup:', widget.pickupPoint),
        _buildRideDetailRow('Destination:', widget.destination),
        _buildRideDetailRow('Time Taken:', widget.eta),
        _buildRideDetailRow(
            'Distance:', '${widget.distance.toStringAsFixed(2)} km'),
      ],
    );
  }

  Widget _buildRideDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: _userRating != null || _isFeedbackProvided
            ? () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Thank You!'),
                    content: const Text('Your payment was successful.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        ),
        child: const Text('Pay'),
      ),
    );
  }
}
