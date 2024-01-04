import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ipark/Home.dart';

class survey extends StatelessWidget {
  final int userId;


  survey({Key? key, required this.userId}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController familyNameController = TextEditingController();
  final TextEditingController carTypeController = TextEditingController();
  final TextEditingController carColorController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();


  final List<String> carColors = ['Red', 'Blue', 'Green', 'Yellow', 'Black', 'White', 'gold', 'silver', 'brown', 'other'];

  String selectedCarColor = '';

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
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/location3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: familyNameController,
                  decoration: InputDecoration(
                    labelText: 'Family Name',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Car Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: carTypeController,
                  decoration: InputDecoration(
                    labelText: 'Car Type',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  value: selectedCarColor.isNotEmpty && carColors.contains(selectedCarColor)
                      ? selectedCarColor
                      : null,
                  decoration: InputDecoration(
                    labelText: 'Car Color',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  items: carColors.map((color) {
                    return DropdownMenuItem<String>(
                      value: color,
                      child: Text(color),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    if (value != null) {
                      selectedCarColor = value;
                    }
                  },
                ),

                SizedBox(height: 30),
                TextFormField(
                  controller: yearController,
                  decoration: InputDecoration(
                    labelText: 'Year',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Contact Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    // Get user input
                    String name = nameController.text;
                    String familyName = familyNameController.text;
                    String carType = carTypeController.text;
                    String carColor = selectedCarColor;
                    String year = yearController.text;
                    String phoneNumber = phoneNumberController.text;

                    // Send data to PHP script
                    final response = await http.post(
                      Uri.parse('https://thornier-designatio.000webhostapp.com/survey.php'),
                      body: {
                        'userId': userId.toString(),
                        'name': name,
                        'familyName': familyName,
                        'carType': carType,
                        'carColor': carColor,
                        'year': year,
                        'phoneNumber': phoneNumber,
                      },
                    );

                    // Handle the response as needed
                    print(response.body);

                    // Navigate to the next page if submission is successful
                    if (response.statusCode == 200) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Home(userId: userId)),
                      );
                    }
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
