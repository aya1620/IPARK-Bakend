import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'survey.dart';
import 'Home.dart';

class login extends StatelessWidget {
   int userId;

  login({Key? key, required this.userId}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Amber-colored section covering the entire height
          Container(
            color: Colors.amber,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 30),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate back to the previous page
                      Navigator.of(context).pop();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 30),
                  child: Text(
                    'Welcome back! Log in with your email and password.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // White-colored bottom section with rounded edges
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 1.4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        child:ElevatedButton(
                          onPressed: () async {
                            // Get user input
                            String email = emailController.text;
                            String password = passwordController.text;

                            // Send data to PHP script (adjust the URL)
                            final response = await http.post(
                              Uri.parse('https://thornier-designatio.000webhostapp.com/login.php'),
                              body: {
                                'email': email,
                                'password': password,
                              },
                            );

                            // Handle the response
                            try {
                              // Check if the response body is valid JSON
                              var jsonResponse = json.decode(response.body);

                              // Check if the 'success' field is present
                              if (jsonResponse.containsKey('success')) {
                                // Check if the operation was successful
                                if (jsonResponse['success']) {
                                  // Extract userId from the response
                                  userId = jsonResponse['userId'];

                                  // Navigate to the next page if login is successful
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => Home(userId: userId)),
                                  );
                                } else {
                                  // Display an error message or handle the error as needed
                                  String errorMessage = jsonResponse['message'] ?? "Unknown error";
                                  print("Login failed: $errorMessage");
                                }
                              } else {
                                // 'success' field not found in the response
                                print("Invalid response format: 'success' field not found");
                              }
                            } catch (e) {
                              // Error decoding JSON or response not in JSON format
                              print("Error handling response: $e");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            minimumSize: Size(double.infinity, 60),
                          ),
                          child: Text('Login'),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Add logic for handling Google login here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            minimumSize: Size(double.infinity, 60),
                          ),
                          icon: Text(
                            '\u{1F30E}',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          label: Text('Continue with Google'),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Add logic for handling Facebook login here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            minimumSize: Size(double.infinity, 60),
                          ),
                          icon: Icon(Icons.facebook),
                          label: Text('Continue with Facebook'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
