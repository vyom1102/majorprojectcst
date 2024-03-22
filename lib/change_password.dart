import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class ForgetPasswordScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Change Password',
//           style: GoogleFonts.kufam(
//             fontSize: 28,
//             color: Color(0xff13E9DC),
//           ),
//         ),
//         backgroundColor: Color(0xff141318),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       backgroundColor: Color(0xff141318),
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('images/Group 174.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextField(
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     hintText: 'Email',
//                     hintStyle: GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff535353)),
//                     ),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff535353)),
//                     ),
//                     fillColor: Color(0xff141318),
//                     filled: true,
//                     prefixIcon: Image.asset('images/email.png', height: 10, width: 10,scale: 3,),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextField(
//                   style: TextStyle(color: Colors.white),
//                   obscureText: true, // Set obscureText to true for password field
//                   decoration: InputDecoration(
//                     hintText: 'Old Password',
//                     hintStyle: GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff535353)),
//                     ),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff535353)),
//                     ),
//                     fillColor: Color(0xff141318),
//                     filled: true,
//                     prefixIcon: Image.asset('images/password.png', height: 10, width: 10, scale: 3),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextField(
//                   style: TextStyle(color: Colors.white),
//                   obscureText: true, // Set obscureText to true for new password field
//                   decoration: InputDecoration(
//                     hintText: 'New Password',
//                     hintStyle: GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff535353)),
//                     ),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff535353)),
//                     ),
//                     fillColor: Color(0xff141318),
//                     filled: true,
//                     prefixIcon: Image.asset('images/password.png', height: 10, width: 10, scale: 3),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextField(
//                   style: TextStyle(color: Colors.white),
//                   obscureText: true, // Set obscureText to true for re-enter password field
//                   decoration: InputDecoration(
//                     hintText: 'Re-enter New Password',
//                     hintStyle: GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff535353)),
//                     ),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff535353)),
//                     ),
//                     fillColor: Color(0xff141318),
//                     filled: true,
//                     prefixIcon: Image.asset('images/password.png', height: 10, width: 10, scale: 3),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Code to send email to recover password
//                   },
//                   style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF13E9DC)),
//                   child: Text(
//                     'Retrieve ',
//                     style: GoogleFonts.kufam(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
//                   ),
//                   // child: Text('Retrieve'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _reenterNewPasswordController = TextEditingController();

  Future<void> changePassword() async {
    try {
      // Sign in with email and password
      final email = _emailController.text;
      final password = _oldPasswordController.text;
      final credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser?.reauthenticateWithCredential(credential);

      // Verify the new password
      final newPassword = _newPasswordController.text;
      final reenteredNewPassword = _reenterNewPasswordController.text;
      if (newPassword != reenteredNewPassword) {
        throw 'Passwords do not match';
      }

      // Change the password
      await _auth.currentUser?.updatePassword(newPassword);
      Navigator.pop(context);
      // Password successfully changed
      // You can show a success message or navigate to another screen
    } catch (error) {
      // Handle errors
      print('Failed to change password: $error');
      // Show an error message to the user
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to change password: $error'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  bool _isOldPasswordVisible = true;
  bool _isNewPasswordVisible = true;
  bool _isReenterPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: GoogleFonts.kufam(
            fontSize: 28,
            color: Color(0xff13E9DC),
          ),
        ),
        backgroundColor: Color(0xff141318),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color(0xff141318),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/Group 174.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle:
                        GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)),
                    ),
                    fillColor: Color(0xff141318),
                    filled: true,
                    prefixIcon: Image.asset('images/email.png',
                        height: 10, width: 10, scale: 3),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _oldPasswordController,
                  style: TextStyle(color: Colors.white),
                  obscureText: !_isOldPasswordVisible, // Toggle obscureText based on visibility
                  decoration: InputDecoration(
                    hintText: 'Old Password',
                    hintStyle: GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)),
                    ),
                    fillColor: Color(0xff141318),
                    filled: true,
                    prefixIcon: Image.asset(
                      'images/password.png',
                      height: 10,
                      width: 10,
                      scale: 3,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isOldPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _isOldPasswordVisible = !_isOldPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _newPasswordController,
                  style: TextStyle(color: Colors.white),
                  obscureText: !_isNewPasswordVisible, // Toggle obscureText based on visibility
                  decoration: InputDecoration(
                    hintText: 'New Password',
                    hintStyle: GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)),
                    ),
                    fillColor: Color(0xff141318),
                    filled: true,
                    prefixIcon: Image.asset(
                      'images/password.png',
                      height: 10,
                      width: 10,
                      scale: 3,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _isNewPasswordVisible = !_isNewPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _reenterNewPasswordController,
                  style: TextStyle(color: Colors.white),
                  obscureText: !_isReenterPasswordVisible, // Toggle obscureText based on visibility
                  decoration: InputDecoration(
                    hintText: 'Re-enter New Password',
                    hintStyle: GoogleFonts.kufam(color: Colors.white.withOpacity(0.5)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff535353)),
                    ),
                    fillColor: Color(0xff141318),
                    filled: true,
                    prefixIcon: Image.asset(
                      'images/password.png',
                      height: 10,
                      width: 10,
                      scale: 3,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isReenterPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _isReenterPasswordVisible = !_isReenterPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    changePassword(); // Call the function to change the password
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF13E9DC)),
                  child: Text(
                    'Change Password',
                    style: GoogleFonts.kufam(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
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
