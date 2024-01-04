import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'survey.dart';
import 'package:google_sign_in/google_sign_in.dart';

class register extends StatelessWidget {
   register({Key? key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   // Google Sign-In instance
   final GoogleSignIn _googleSignIn = GoogleSignIn(clientId: 'clientId');

   Future<void> _handleSignIn(BuildContext context) async {
     try {
       final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

       if (googleSignInAccount != null) {
         // Get user input
         String email = googleSignInAccount.email ?? '';
         String password = ''; // Google Sign-In doesn't provide a password

         // Send data to PHP script



         final response = await http.post(
           Uri.parse('https://thornier-designatio.000webhostapp.com/google.php'),
           body: {
             'email': email,
             'password': password,
           },
         );

         // Handle the response as needed
         print(response.body);

         // Navigate to the next page if registration is successful
         if (response.statusCode == 200) {
           // Parse the userId from the response body
           int userId = int.tryParse(response.body) ?? 0;

           // Navigate to the survey page passing the user_id
           Navigator.of(context).push(
             MaterialPageRoute(builder: (context) => survey(userId: userId)),
           );
         }
       }
     } catch (error) {
       print('Google Sign-In Error: $error');
     }
   }

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
                          'Sign Up',
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
                    'If you don\'t have a previous account, you can sign up by providing a new email and creating a password below.',
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
                        child: ElevatedButton(
                          onPressed: () async {
                            // Get user input
                            String email = emailController.text;
                            String password = passwordController.text;

                            // Send data to PHP script
                            final response = await http.post(
                              Uri.parse('https://thornier-designatio.000webhostapp.com/signup.php'),
                              body: {
                                'email': email,
                                'password': password,
                              },
                            );

                            // Handle the response as needed
                            print(response.body);

                            // Navigate to the next page if registration is successful
                            if (response.statusCode == 200) {
                              // Parse the userId from the response body
                              int userId = int.tryParse(response.body) ?? 0;

                              // Navigate to the survey page passing the user_id
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => survey(userId: userId)),
                              );
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
                          child: Text('Sign Up'),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Call the method to handle Google Sign-In
                            _handleSignIn(context);
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
