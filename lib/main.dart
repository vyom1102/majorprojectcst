//
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//  import 'package:majorproject/student_main_screen.dart';
// import 'firebase_options.dart';
// import 'student_main_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
//

// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginScreen(),
//     );
//   }
// }
//
// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff141318),
//       body: Stack(
//         children: [
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Image.asset(
//               'images/bottom_container.png',
//               fit: BoxFit.cover,
//               height: 200, // Adjust the height as needed
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('images/mait25logoo.jpg', height: 150, width: 150),
//                 SizedBox(height: 20),
//                 Row(
//                   children: [
//                     SizedBox(width: 10,),
//                     Text(
//                       'LOG IN ',
//                       style: GoogleFonts.kufam(fontSize: 24, fontWeight: FontWeight.w600,color: Color(0xff13E9DC)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//
//                 TextField(
//
//                   decoration: InputDecoration(
//
//                     hintText: 'Username',
//                     hintStyle: GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff535353)), // Set the color of the bottom border when the field is focused
//                     ),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff535353)), // Set the color of the bottom border when the field is not focused
//                     ),
//                     fillColor: Color(0xff141318),
//                     filled: true,
//                     prefixIcon: Image.asset('images/email.png', height: 10, width: 10,scale: 3,),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: 'Password',
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff535353)), // Set the color of the bottom border when the field is focused
//                     ),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff535353)), // Set the color of the bottom border when the field is not focused
//                     ),
//                     hintStyle: GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
//                     // hintStyle: TextStyle(color: Color(0xffFFFFFF).withOpacity(50)),
//                     fillColor: Color(0xff141318),
//                     filled: true,
//                     prefixIcon: Image.asset('images/password.png', height: 10, width: 10,scale: 3,),
//
//                   ),
//                 ),
//                 SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => StudentSelectionScreen()),
//                     );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF13E9DC),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
//               ),
//               child: Text(
//                 'Log In ',
//                 style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
//               ),
//             ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/adminscreen.dart';
import 'package:majorproject/firebase_options.dart';
import 'package:majorproject/student_data_sheet_screen.dart';
import 'package:majorproject/teacher_data_sheet_screen.dart';
import 'package:majorproject/teacher_main_screen.dart';
import 'student_main_screen.dart';

void main() async {
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

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signInUser(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Firebase sign-in successful, navigate to the appropriate screen
      String userRole = getUserRoleFromEmail(email);
      if (userRole == 'student') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StudentSelectionScreen()),
              // studentDataSheet()),
        );
      } else if (userRole == 'teacher') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TeacherDataSheet()),
        );
      } else if (userRole == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminScreen()),
        );
      }
    } catch (e) {

      print(e.toString());

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  String getUserRoleFromEmail(String email) {

    if (email.contains('@student.com')) {
      return 'student';
    } else if (email.contains('@teacher.com')) {
      return 'teacher';
    } else if (email.contains('@admin.com')) {
      return 'admin';
    }

    // Default to a role if the email doesn't match any predefined patterns
    return 'unknown';
  }

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
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/mait25logoo.jpg', height: 150, width: 150),
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
                  style: TextStyle(color: Colors.white),
                  controller: emailController,

                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)),
                    ),
                    fillColor: Color(0xff141318),
                    filled: true,
                    prefixIcon: Image.asset('images/email.png', height: 10, width: 10,scale: 3,),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)),
                    ),
                    hintStyle: GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
                    fillColor: Color(0xff141318),
                    filled: true,
                    prefixIcon: Image.asset('images/password.png', height: 10, width: 10,scale: 3,),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    signInUser(context);
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
