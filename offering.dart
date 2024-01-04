import 'package:flutter/material.dart';

class offering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'I',
                style: TextStyle(color: Colors.white, fontSize: 62),
              ),
              TextSpan(
                text: 'PARK',
                style: TextStyle(color: Colors.yellow, fontSize: 58),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Current Offers',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            OfferCard(
              title: 'Free Hour of Parking',
              description: 'Get one hour of parking free with any booking!',
              imagePath: 'assets/images.png',
            ),
            SizedBox(height: 10),
            OfferCard(
              title: 'Weekend Special',
              description: '50% off on the 3rd floor during weekends.',
              imagePath: 'assets/p.png',
            ),
            SizedBox(height: 10),
            MovingMessage(),
            // Add more OfferCard widgets or other components as needed
          ],
        ),
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OfferCard({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image.asset(
              imagePath,
              height: 250, // Adjust the height as needed
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MovingMessage extends StatefulWidget {
  @override
  _MovingMessageState createState() => _MovingMessageState();
}

class _MovingMessageState extends State<MovingMessage> {
  final String message = 'Limited Time Offer! thanks';
  double position = 0;

  @override
  void initState() {
    super.initState();
    _startMovingMessage();
  }

  void _startMovingMessage() {
    Future.delayed(Duration(milliseconds: 1), () {
      if (position < message.length * 10) {
        setState(() {
          position += 1;
        });
        _startMovingMessage();
      }else {
        // Reset position when it reaches the end
        position = 0;
        _startMovingMessage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: position),
          child: Text(
            message,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.amber, // Customize the text color
            ),
          ),
        ),
      ),
    );
  }
}