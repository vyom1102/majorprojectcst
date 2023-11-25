

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 import 'package:majorproject/student_main_screen.dart';
import 'firebase_options.dart';
import 'student_main_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141318),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'images/bottom_container.png',
              fit: BoxFit.cover,
              height: 200, // Adjust the height as needed
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/mait25logo.jpg', height: 150, width: 150),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text(
                      'LOG IN ',
                      style: GoogleFonts.kufam(fontSize: 24, fontWeight: FontWeight.w600,color: Color(0xff13E9DC)),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                TextField(

                  decoration: InputDecoration(

                    hintText: 'Username',
                    hintStyle: GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)), // Set the color of the bottom border when the field is focused
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)), // Set the color of the bottom border when the field is not focused
                    ),
                    fillColor: Color(0xff141318),
                    filled: true,
                    prefixIcon: Image.asset('images/email.png', height: 10, width: 10,scale: 3,),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)), // Set the color of the bottom border when the field is focused
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)), // Set the color of the bottom border when the field is not focused
                    ),
                    hintStyle: GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
                    // hintStyle: TextStyle(color: Color(0xffFFFFFF).withOpacity(50)),
                    fillColor: Color(0xff141318),
                    filled: true,
                    prefixIcon: Image.asset('images/password.png', height: 10, width: 10,scale: 3,),

                  ),
                ),
                SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudentSelectionScreen()),
                    );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF13E9DC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
              ),
              child: Text(
                'Log In ',
                style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
              ),
            ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
