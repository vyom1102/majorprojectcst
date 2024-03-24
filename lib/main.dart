
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/admin/adminHome.dart';
import 'package:majorproject/admin/adminscreen.dart';
import 'package:majorproject/firebase_options.dart';
import 'package:majorproject/student_data_sheet_screen.dart';
import 'package:majorproject/teacher_data_sheet_screen.dart';
import 'package:majorproject/teacher_main_screen.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'student_main_screen.dart';
import 'change_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        home:  IsLogin(),
        //LoginScreen(),

    );
  }
}
class IsLogin extends StatefulWidget {
  @override
  _IsLoginState createState() => _IsLoginState();
}

class _IsLoginState extends State<IsLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Check if the user is already signed in when the widget initializes
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');

    // Check if email and password are saved locally
    if (email != null && password != null) {
      try {
        // Try signing in the user using saved credentials
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        // If sign-in is successful, navigate to the student selection screen
        if(email.toString().contains('student')){
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StudentSelectionScreen()),
        );}
        else if(email.toString().contains('teacher')){Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TeacherDataSheet()),
        );}
        else if(email.toString().contains('admin')){Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminHome()),
        );}
      } catch (e) {
        // If sign-in fails, clear saved credentials
        await clearSavedCredentials();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen())
        );
      }
    }else {
      // If no saved credentials, navigate to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
  }}

  Future<void> clearSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('password');
  }

  @override
  Widget build(BuildContext context) {
    // You can build any UI here if needed
    return Container();
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

    if (!isValidEmail(email)) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.warning,
        text: 'Please enter a valid Email',
      );
      return; // Exit the method if email is invalid
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Firebase sign-in successful, navigate to the appropriate screen
      String userRole = getUserRoleFromEmail(email);
      if (userRole == 'student') {
        saveCredentials(email, password);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>
              //StudentSelectionScreen()),
              studentDataSheet()),
        );
      } else if (userRole == 'teacher') {
        saveCredentials(email, password);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>
              TeacherDataSheet()),
          // studentDataSheet()),
        );
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => TeacherDataSheet()),
        // );
      } else if (userRole == 'admin') {
        saveCredentials(email, password);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>
              AdminHome()),
          // studentDataSheet()),
        );
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => AdminHome()),
        // );
      }
    } catch (e) {

      print(e.toString());

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  Future<void> saveCredentials(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);
  }
  bool _isObscure = true;
  bool _isPasswordEmpty = true;

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
              height: MediaQuery.sizeOf(context).height*0.185,
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
                // TextField(
                //   style: TextStyle(color: Colors.white),
                //   controller: passwordController,
                //   obscureText: true,
                //   decoration: InputDecoration(
                //     hintText: 'Password',
                //     focusedBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(color: Color(0xff535353)),
                //     ),
                //     enabledBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(color: Color(0xff535353)),
                //     ),
                //     hintStyle: GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
                //     fillColor: Color(0xff141318),
                //     filled: true,
                //     prefixIcon: Image.asset('images/password.png', height: 10, width: 10,scale: 3,),
                //   ),
                // ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: _isObscure,
                  onChanged: (value) {
                    setState(() {
                      _isPasswordEmpty = value.isEmpty; // Update password empty state
                    });
                  },
                  controller: passwordController,
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
                    prefixIcon: Image.asset(
                      'images/password.png',
                      height: 10,
                      width: 10,
                      scale: 3,
                    ),
                    suffixIcon: _isPasswordEmpty
                        ? null // Hide suffix icon if password field is empty
                        : IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {
                //     signInUser(context);
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Color(0xFF13E9DC),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(20.0),
                //     ),
                //     minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
                //   ),
                //   child: Text(
                //     'Log In ',
                //     style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
                //   ),
                // ),
                Column(
                  children: [
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
                        style: GoogleFonts.kufam(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 10), // Add some space between the buttons
                    TextButton(
                      onPressed: () {
                        // Navigate to the forget password screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
                        );
                      },
                      child: Text(
                        'Change Password',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}

bool isValidEmail(String email) {
  // Implement your email validation logic here
  // For example, you can use a regular expression
  // to check if the email matches a certain pattern
  // This is just a simple example, you may need to adjust it
  String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regex = RegExp(emailPattern);
  return regex.hasMatch(email);
}