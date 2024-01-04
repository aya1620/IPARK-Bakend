import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'survey.dart';
import 'offering.dart';

class Home3 extends StatefulWidget {
  final int userId;
  final String? name;
  final String? familyName;
  final String? carType;

  Home3({required this.userId, this.name, this.familyName, this.carType});
  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  List<bool> isOccupiedList = List.generate(14, (index) => false);
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();
  double parkingPrice = 1.0;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.amber,
            colorScheme: ColorScheme.light(primary: Colors.amber),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.amber,
            colorScheme: ColorScheme.light(primary: Colors.amber),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _showPrice() {
    // Placeholder logic for fetching the actual parking price
    double pricePerMonth = 20.0; // Replace with your logic to get the actual price per month

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: Text('Parking Price'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Price: \$${parkingPrice.toString()}'),
              SizedBox(height: 8.0),
              Text('Price per Month: \$${pricePerMonth.toString()}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Colors.amber,
        );
      },
    );
  }

  void _showMenu(BuildContext context) async {
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;

    final List<PopupMenuItem<String>> items = [
      PopupMenuItem<String>(
        value: 'survey',
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: ListTile(
            leading: Icon(Icons.edit, color: Colors.black),
            title: Text(
              'Edit Survey',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      PopupMenuItem<String>(
        value: 'offers',
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: ListTile(
            leading: Icon(Icons.local_offer, color: Colors.black),
            title: Text(
              'View Offers',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    ];

    final String? result = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(0, 0, 0, overlay.size.height),
      items: items,
      elevation: 8,
      color: Colors.amber,
    );

    if (result == 'survey') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => survey(userId: widget.userId)),
      );
    } else if (result == 'offering') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => offering()),
      );
    }
  }

  // Function to send parking reservation data to PHP script
  Future<void> _reserveParking(int parkingSpot) async {
    // Get formatted date and time
    String formattedDate = selectedDate!.toLocal().toString().split(' ')[0];
    String formattedTime = selectedTime!.format(context);

    // Send data to PHP script
    final response = await http.post(
      Uri.parse('https://thornier-designatio.000webhostapp.com/parking.php'),
      body: {
        'userId': widget.userId.toString(),
        'parkingSpot': parkingSpot.toString(),
        'reservationDate': formattedDate,
        'reservationTime': formattedTime,
      },
    );

    // Handle the response as needed
    print(response.body);

    // Navigate to the next page if reservation is successful
    if (response.statusCode == 200) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home3(userId: widget.userId)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            iconSize: 40.0,
            onPressed: () {
              _showMenu(context);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets3.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                    ),
                  ),
                  Container(
                    height: double.infinity,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: 14,
                  itemBuilder: (context, index) {
                    int parkingNumber = index + 29;
                    String parkingText = 'P$parkingNumber';
                    return GestureDetector(
                      onTap: () async {
                        await _selectDate(context);
                        await _selectTime(context);
                        setState(() {
                          isOccupiedList[index] = true;
                        });
                        await _reserveParking(index + 1); // Reserve parking spot
                      },
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: isOccupiedList[index] ? Colors.red : Colors.green,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                parkingText,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                              if (isOccupiedList[index])
                                Text(
                                  'Reserved',
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.white,
                                  ),
                                ),
                            ],
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
        bottomNavigationBar: BottomAppBar(
          color: Colors.amber,
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.attach_money,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _showPrice();
                      },
                    ),
                    Text(
                      'Price: \$${parkingPrice.toString()}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
  }
}