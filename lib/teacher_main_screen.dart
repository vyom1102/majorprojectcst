//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:majorproject/academic_activity_screen.dart';
// import 'package:majorproject/details.dart';
// import 'package:majorproject/main.dart';
// import 'package:majorproject/detailScreens/StudentData/student_personaldetail.dart';
// import 'package:majorproject/teachers_activity_folder/courses_completed_screen.dart';
// import 'package:majorproject/teachers_activity_folder/event_attended_screen.dart';
// import 'package:majorproject/teachers_activity_folder/event_organised_screen.dart';
// import 'package:majorproject/teachers_activity_folder/publications_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class TeacherSelectionScreen extends StatefulWidget {
//   @override
//   _TeacherSelectionScreenState createState() => _TeacherSelectionScreenState();
// }
//
// class _TeacherSelectionScreenState extends State<TeacherSelectionScreen> {
//   String selectedButton = '';
//   Future<void> clearSavedCredentials() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('email');
//     prefs.remove('password');
//   }
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       backgroundColor: Color(0xff141318),
//       body: Stack(
//
//         children: [
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Image.asset(
//               'images/bottom_container.png',
//               fit: BoxFit.cover,
//               height: 200,
//               width: MediaQuery.sizeOf(context).width,// Adjust the height as needed
//             ),
//           ),
//           SingleChildScrollView(
//             child: Column(
//
//               children: [
//                 SizedBox(height: 50,),
//                 Row(
//
//                   children: [
//                     IconButton(
//                       icon: Image.asset('images/drawer.png',
//                         width: 30.0,
//                         height: 30.0,),
//                       onPressed: () {
//                         _scaffoldKey.currentState?.openDrawer();
//                       },
//                     ),
//                     SizedBox(width: 80,),
//                     Text('TEACHER',style: GoogleFonts.kufam(fontWeight: FontWeight.w600,fontSize: 26,color: Color(0xff0CECDA)),),
//                   ],
//                 ),
//                 SizedBox(height: 20,),
//                 Center(child: Image.asset('images/teacher.png', scale: 3, )),
//                 SizedBox(height: 20),
//
//
//                 // Buttons
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       selectedButton = 'Button 1';
//                     });
//                   },
//
//                   style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all(
//                       Size(0.9 * MediaQuery.of(context).size.width, 48.0),
//                     ),
//                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                           (Set<MaterialState> states) {
//                         if (states.contains(MaterialState.pressed)) {
//                           // Pressed color
//                           return Color.fromRGBO(12, 236, 218, 0.5);
//                         } else if (states.contains(MaterialState.selected) || selectedButton == 'Button 1') {
//                           // Selected color
//                           return Color.fromRGBO(12, 236, 218, 0.5);
//                         } else {
//                           // Default color
//                           return Colors.black;
//                         }
//                       },
//                     ),
//                     shape: MaterialStateProperty.all<OutlinedBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0), // Set the border radius
//                         side: BorderSide(color: Color(0xFF0CECDA)), // Set the border color
//                       ),
//                     ),
//                   ),
//                   child: Text('Event Attended',
//                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                 ),
//                 SizedBox(height: 20,),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       selectedButton = 'Button 2';
//                     });
//                   },
//                   style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all(
//                       Size(0.9 * MediaQuery.of(context).size.width, 48.0),
//                     ),
//                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                           (Set<MaterialState> states) {
//                         if (states.contains(MaterialState.pressed)) {
//                           // Pressed color
//                           return Color.fromRGBO(12, 236, 218, 0.5);
//                         } else if (states.contains(MaterialState.selected) || selectedButton == 'Button 2') {
//                           // Selected color
//                           return Color.fromRGBO(12, 236, 218, 0.5);
//                         } else {
//                           // Default color
//                           return Colors.black;
//                         }
//                       },
//                     ),
//                     shape: MaterialStateProperty.all<OutlinedBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0), // Set the border radius
//                         side: BorderSide(color: Color(0xFF0CECDA)), // Set the border color
//                       ),
//                     ),
//                   ),
//                   child: Text('Event Organized',
//                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                 ),
//                 SizedBox(height: 20,),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       selectedButton = 'Button 3';
//                     });
//                   },
//                   style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all(
//                       Size(0.9 * MediaQuery.of(context).size.width, 48.0),
//                     ),
//                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                           (Set<MaterialState> states) {
//                         if (states.contains(MaterialState.pressed) || selectedButton == 'Button 3') {
//                           // Pressed color
//                           return Color.fromRGBO(12, 236, 218, 0.5);
//                         } else if (states.contains(MaterialState.selected)) {
//                           // Selected color
//                           return Color.fromRGBO(12, 236, 218, 0.5);
//                         } else {
//                           // Default color
//                           return Colors.black;
//                         }
//                       },
//                     ),
//                     shape: MaterialStateProperty.all<OutlinedBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0), // Set the border radius
//                         side: BorderSide(color: Color(0xFF0CECDA)), // Set the border color
//                       ),
//                     ),
//                   ),
//                   child: Text('Courses Completed',
//                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                 ),
//                 SizedBox(height: 20,),
//
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       selectedButton = 'Button 4';
//                     });
//                   },
//                   style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all(
//                       Size(0.9 * MediaQuery.of(context).size.width, 48.0),
//                     ),
//                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                           (Set<MaterialState> states) {
//                         if (states.contains(MaterialState.pressed) || selectedButton == 'Button 4') {
//                           // Pressed or selected color
//                           return Color.fromRGBO(12, 236, 218, 0.5);
//                         } else {
//                           // Default color
//                           return Colors.black;
//                         }
//                       },
//                     ),
//                     shape: MaterialStateProperty.all<OutlinedBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0), // Set the border radius
//                         side: BorderSide(color: Color(0xFF0CECDA)),
//                       ),
//                     ),
//                   ),
//                   child: Text('Publication',
//                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                 ),
//
//
//                 SizedBox(height: MediaQuery.sizeOf(context).height*0.08),
//
//                 ElevatedButton(
//                     style: ButtonStyle(
//                       minimumSize: MaterialStateProperty.all(
//                         Size(0.9 * MediaQuery.of(context).size.width, 48.0),
//                       ),
//                       backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//
//                             return Colors.black;
//
//                         },
//                       ),
//                       shape: MaterialStateProperty.all<OutlinedBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0), // Set the border radius
//                           side: BorderSide(color: Color(0xFF0CECDA)), // Set the border color
//                         ),
//                       ),
//                     ),
//                   onPressed: (){
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Details(),
//                             // StudentList(),
//                       ),
//                     );
//                   },
//                   child: Text('Go to details ->' ,style: GoogleFonts.kufam(color: Color(0xFF0CECDA),fontSize: 16,fontWeight: FontWeight.w500),),),
//                 SizedBox(height: 20,),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF13E9DC),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
//                   ),
//                   onPressed: () {
//                     if (selectedButton.isNotEmpty) {
//                       if (selectedButton == 'Button 1') {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => EventAttendedScreen(),
//                           ),
//                         );
//                       } else if (selectedButton == 'Button 2') {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => EventOrganisedScreen(),
//                           ),
//                         );
//                       } else if (selectedButton == 'Button 3') {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCompletedScreen(),
//                           ),
//                         );
//                       } else if (selectedButton == 'Button 4') {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => PublicationScreen(),
//                           ),
//                         );
//                       }
//                     } else {
//                       // Show a message or handle the case when no button is selected.
//                       print('Please select a button.');
//                     }
//                   },
//                   child: Text('Next',style: GoogleFonts.kufam(color: Color(0xff1E192E),fontSize: 20,fontWeight: FontWeight.w500),),
//                 ),
//
//               ],
//             ),
//           ),
//
//         ],
//       ),
//       drawer: Drawer(
//         child: Container(
//           color: Colors.white, // Set the drawer background color to grey
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               UserAccountsDrawerHeader(
//                 accountName: Text(
//                   'Your Name',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 accountEmail: Text(
//                   'your.email@example.com',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 currentAccountPicture: CircleAvatar(
//                   backgroundImage:
//                   AssetImage('images/CSE_MAIT_FULL_LOGO_TEST1.png'),
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.grey, // Set the header background color to grey
//                 ),
//               ),
//               SizedBox(height: MediaQuery.sizeOf(context).height*0.65,),
//               // ElevatedButton(
//               //   style: ElevatedButton.styleFrom(
//               //     backgroundColor: Color(0xFF13E9DC),
//               //     shape: RoundedRectangleBorder(
//               //       borderRadius: BorderRadius.circular(20.0),
//               //     ),
//               //     minimumSize:
//               //     Size(70, 40.0),
//               //   ),
//               //   onPressed: () {
//               //     Navigator.pop(context); // Close the drawer
//               //     Navigator.pushReplacement(
//               //       context,
//               //       MaterialPageRoute(builder: (context) => LoginScreen()),
//               //     );
//               //   },
//               //   child: Text(
//               //     'Log out',
//               //     style: GoogleFonts.kufam(
//               //         color: Color(0xff1E192E),
//               //         fontSize: 20,
//               //         fontWeight: FontWeight.w500),
//               //   ),
//               // ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF13E9DC),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   minimumSize: Size(70, 40.0),
//                 ),
//                 onPressed: () async {
//                   // Close the drawer
//                   Navigator.pop(context);
//
//                   // Remove user details from SharedPreferences
//                   await clearSavedCredentials();
//
//                   // Navigate to the login screen
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => LoginScreen()),
//                   );
//                 },
//                 child: Text(
//                   'Log out',
//                   style: GoogleFonts.kufam(
//                       color: Color(0xff1E192E),
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/details.dart';
import 'package:majorproject/main.dart';
import 'package:majorproject/detailScreens/StudentData/student_personaldetail.dart';
import 'package:majorproject/teachers_activity_folder/courses_completed_screen.dart';
import 'package:majorproject/teachers_activity_folder/event_attended_screen.dart';
import 'package:majorproject/teachers_activity_folder/event_organised_screen.dart';
import 'package:majorproject/teachers_activity_folder/publications_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherSelectionScreen extends StatefulWidget {
  @override
  _TeacherSelectionScreenState createState() => _TeacherSelectionScreenState();
}

class _TeacherSelectionScreenState extends State<TeacherSelectionScreen> {
  String selectedButton = '';
  Future<void> clearSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('password');
  }
  Future<Map<String, String>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('student_name') ?? 'Your Name';
    String email = prefs.getString('student_email') ?? 'your.email@example.com';
    return {'name': name, 'email': email};
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              width: MediaQuery.sizeOf(context).width,// Adjust the height as needed
            ),
          ),
          SingleChildScrollView(
            child: Column(

              children: [
                SizedBox(height: 50,),
                Row(

                  children: [
                    IconButton(
                      icon: Image.asset('images/drawer.png',
                        width: 30.0,
                        height: 30.0,),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    SizedBox(width: 80,),
                    Text('TEACHER',style: GoogleFonts.kufam(fontWeight: FontWeight.w600,fontSize: 26,color: Color(0xff0CECDA)),),
                  ],
                ),
                SizedBox(height: 20,),
                Center(child: Image.asset('images/teacher.png', scale: 3, )),
                SizedBox(height: 20),


                // Buttons
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Button 1';
                    });
                  },

                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(0.9 * MediaQuery.of(context).size.width, 48.0),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          // Pressed color
                          return Color.fromRGBO(12, 236, 218, 0.5);
                        } else if (states.contains(MaterialState.selected) || selectedButton == 'Button 1') {
                          // Selected color
                          return Color.fromRGBO(12, 236, 218, 0.5);
                        } else {
                          // Default color
                          return Colors.black;
                        }
                      },
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Set the border radius
                        side: BorderSide(color: Color(0xFF0CECDA)), // Set the border color
                      ),
                    ),
                  ),
                  child: Text('Event Attended',
                    style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Button 2';
                    });
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(0.9 * MediaQuery.of(context).size.width, 48.0),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          // Pressed color
                          return Color.fromRGBO(12, 236, 218, 0.5);
                        } else if (states.contains(MaterialState.selected) || selectedButton == 'Button 2') {
                          // Selected color
                          return Color.fromRGBO(12, 236, 218, 0.5);
                        } else {
                          // Default color
                          return Colors.black;
                        }
                      },
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Set the border radius
                        side: BorderSide(color: Color(0xFF0CECDA)), // Set the border color
                      ),
                    ),
                  ),
                  child: Text('Event Organized',
                    style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Button 3';
                    });
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(0.9 * MediaQuery.of(context).size.width, 48.0),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed) || selectedButton == 'Button 3') {
                          // Pressed color
                          return Color.fromRGBO(12, 236, 218, 0.5);
                        } else if (states.contains(MaterialState.selected)) {
                          // Selected color
                          return Color.fromRGBO(12, 236, 218, 0.5);
                        } else {
                          // Default color
                          return Colors.black;
                        }
                      },
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Set the border radius
                        side: BorderSide(color: Color(0xFF0CECDA)), // Set the border color
                      ),
                    ),
                  ),
                  child: Text('Courses Completed',
                    style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                ),
                SizedBox(height: 20,),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Button 4';
                    });
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(0.9 * MediaQuery.of(context).size.width, 48.0),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed) || selectedButton == 'Button 4') {
                          // Pressed or selected color
                          return Color.fromRGBO(12, 236, 218, 0.5);
                        } else {
                          // Default color
                          return Colors.black;
                        }
                      },
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Set the border radius
                        side: BorderSide(color: Color(0xFF0CECDA)),
                      ),
                    ),
                  ),
                  child: Text('Publication',
                    style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                ),


                SizedBox(height: MediaQuery.sizeOf(context).height*0.08),

                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(0.9 * MediaQuery.of(context).size.width, 48.0),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {

                        return Colors.black;

                      },
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Set the border radius
                        side: BorderSide(color: Color(0xFF0CECDA)), // Set the border color
                      ),
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(),
                        // StudentList(),
                      ),
                    );
                  },
                  child: Text('Go to details ->' ,style: GoogleFonts.kufam(color: Color(0xFF0CECDA),fontSize: 16,fontWeight: FontWeight.w500),),),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF13E9DC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
                  ),
                  onPressed: () {
                    if (selectedButton.isNotEmpty) {
                      if (selectedButton == 'Button 1') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventAttendedScreen(),
                          ),
                        );
                      } else if (selectedButton == 'Button 2') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventOrganisedScreen(),
                          ),
                        );
                      } else if (selectedButton == 'Button 3') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseCompletedScreen(),
                          ),
                        );
                      } else if (selectedButton == 'Button 4') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PublicationScreen(),
                          ),
                        );
                      }
                    } else {
                      // Show a message or handle the case when no button is selected.
                      print('Please select a button.');
                    }
                  },
                  child: Text('Next',style: GoogleFonts.kufam(color: Color(0xff1E192E),fontSize: 20,fontWeight: FontWeight.w500),),
                ),

              ],
            ),
          ),

        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white, // Set the drawer background color to grey
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // UserAccountsDrawerHeader(
              //   accountName: Text(
              //     'Your Name',
              //     style: TextStyle(color: Colors.black),
              //   ),
              //   accountEmail: Text(
              //     'your.email@example.com',
              //     style: TextStyle(color: Colors.black),
              //   ),
              //   currentAccountPicture: CircleAvatar(
              //     backgroundImage:
              //     AssetImage('images/CSE_MAIT_FULL_LOGO_TEST1.png'),
              //   ),
              //   decoration: BoxDecoration(
              //     color: Colors.grey, // Set the header background color to grey
              //   ),
              // ),
              FutureBuilder<Map<String, String>>(
                future: getUserData(), // Fetch user data asynchronously
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Show loading indicator while fetching data
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    String name = snapshot.data?['name'] ?? 'Your Name';
                    String email = snapshot.data?['email'] ?? 'your.email@example.com';
                    return UserAccountsDrawerHeader(
                      accountName: Text(
                        name,
                        style: TextStyle(color: Colors.black),
                      ),
                      accountEmail: Text(
                        email,
                        style: TextStyle(color: Colors.black),
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage('images/CSE_MAIT_FULL_LOGO_TEST1.png'),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey, // Set the header background color to grey
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.65,),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Color(0xFF13E9DC),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20.0),
              //     ),
              //     minimumSize:
              //     Size(70, 40.0),
              //   ),
              //   onPressed: () {
              //     Navigator.pop(context); // Close the drawer
              //     Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(builder: (context) => LoginScreen()),
              //     );
              //   },
              //   child: Text(
              //     'Log out',
              //     style: GoogleFonts.kufam(
              //         color: Color(0xff1E192E),
              //         fontSize: 20,
              //         fontWeight: FontWeight.w500),
              //   ),
              // ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF13E9DC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  minimumSize: Size(70, 40.0),
                ),
                onPressed: () async {
                  // Close the drawer
                  Navigator.pop(context);

                  // Remove user details from SharedPreferences
                  await clearSavedCredentials();

                  // Navigate to the login screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  'Log out',
                  style: GoogleFonts.kufam(
                      color: Color(0xff1E192E),
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}