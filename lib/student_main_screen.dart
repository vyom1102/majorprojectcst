// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:majorproject/academic_activity_screen.dart';
// import 'package:majorproject/StudentActivities/co-curricular_activity_screen.dart';
// import 'package:majorproject/main.dart';
// import 'package:majorproject/teacher_data_sheet_screen.dart';
// import 'package:majorproject/teacher_main_screen.dart';
// import 'package:majorproject/student_data_sheet_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'StudentActivities/sports_screen.dart';
// import 'StudentActivities/co-curricular_folder/community_service.dart';
// import 'StudentActivities/ncc_nss_activity_screen.dart';
//
// class StudentSelectionScreen extends StatefulWidget {
//   @override
//   _StudentSelectionScreenState createState() => _StudentSelectionScreenState();
// }
//
// class _StudentSelectionScreenState extends State<StudentSelectionScreen> {
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
//         children: [
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Image.asset(
//               'images/bottom_container.png',
//               fit: BoxFit.cover,
//               height: MediaQuery.sizeOf(context).height*0.25,
//               width: MediaQuery.sizeOf(context)
//                   .width, // Adjust the height as needed
//             ),
//           ),
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//
//                   height: MediaQuery.sizeOf(context).height*0.1,
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Image.asset('images/drawer.png',
//                       width: 30.0,
//                       height: 30.0,
//                       ),
//                       onPressed: () {
//                         _scaffoldKey.currentState?.openDrawer();
//                       },
//                     ),
//                     SizedBox(
//                       width: MediaQuery.sizeOf(context).width*0.2,
//                     ),
//                     Text(
//                       'STUDENT',
//                       style: GoogleFonts.kufam(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 26,
//                           color: Color(0xff0CECDA)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: MediaQuery.sizeOf(context).height*0.05,
//                 ),
//                 Center(
//                     child: Image.asset(
//                   'images/student.png',
//                   scale: 3,
//                 )),
//                 SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
//
//                 // Buttons
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       selectedButton = 'Button 1';
//                     });
//                   },
//                   style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all(
//                       Size(0.9 * MediaQuery.of(context).size.width,MediaQuery.sizeOf(context).height*0.059,),
//                     ),
//                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                       (Set<MaterialState> states) {
//                         if (states.contains(MaterialState.pressed)) {
//                           // Pressed color
//                           return Color.fromRGBO(12, 236, 218, 0.5);
//                         } else if (states.contains(MaterialState.selected) ||
//                             selectedButton == 'Button 1') {
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
//                         borderRadius:
//                             BorderRadius.circular(8.0), // Set the border radius
//                         side: BorderSide(
//                             color: Color(0xFF0CECDA)), // Set the border color
//                       ),
//                     ),
//                   ),
//                   child: Text('Academic Activity',
//                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                 ),
//                 SizedBox(
//                     height: MediaQuery.sizeOf(context).height*0.025,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       selectedButton = 'Button 2';
//                     });
//                   },
//                   style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all(
//                       Size(0.9 * MediaQuery.of(context).size.width,MediaQuery.sizeOf(context).height*0.059,),
//                     ),
//                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                       (Set<MaterialState> states) {
//                         if (states.contains(MaterialState.pressed)) {
//                           // Pressed color
//                           return Color.fromRGBO(12, 236, 218, 0.5);
//                         } else if (states.contains(MaterialState.selected) ||
//                             selectedButton == 'Button 2') {
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
//                         borderRadius:
//                             BorderRadius.circular(8.0), // Set the border radius
//                         side: BorderSide(
//                             color: Color(0xFF0CECDA)), // Set the border color
//                       ),
//                     ),
//                   ),
//                   child: Text('Co-curricular Activity',
//                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.sizeOf(context).height*0.025,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       selectedButton = 'Button 3';
//                     });
//                   },
//                   style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all(
//                       Size(0.9 * MediaQuery.of(context).size.width,MediaQuery.sizeOf(context).height*0.059,),
//                     ),
//                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                       (Set<MaterialState> states) {
//                         if (states.contains(MaterialState.pressed)) {
//                           // Pressed color
//                           return Color.fromRGBO(12, 236, 218, 0.5);
//                         } else if (states.contains(MaterialState.selected) ||
//                             selectedButton == 'Button 3') {
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
//                         borderRadius:
//                             BorderRadius.circular(8.0), // Set the border radius
//                         side: BorderSide(
//                             color: Color(0xFF0CECDA)), // Set the border color
//                       ),
//                     ),
//                   ),
//                   child: Text('Sports',
//                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.sizeOf(context).height*0.025,
//                 ),
//
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       selectedButton = 'button 4';
//                     });
//                   },
//                   style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all(
//                       Size(0.9 * MediaQuery.of(context).size.width,MediaQuery.sizeOf(context).height*0.059,),
//                     ),
//                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                       (Set<MaterialState> states) {
//                         if (states.contains(MaterialState.pressed) ||
//                             selectedButton == 'button 4') {
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
//                         borderRadius:
//                             BorderRadius.circular(8.0), // Set the border radius
//                         side: BorderSide(color: Color(0xFF0CECDA)),
//                       ),
//                     ),
//                   ),
//                   child: Text('NCC/NSS',
//                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                 ),
//
//                 SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
//
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF13E9DC),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     minimumSize:
//                     Size(0.9 * MediaQuery.of(context).size.width,MediaQuery.sizeOf(context).height*0.059,),
//                   ),
//                   onPressed: () {
//                     if (selectedButton.isNotEmpty) {
//                       if (selectedButton == 'Button 1') {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => AcademicScreen(),
//                           ),
//                         );
//                       } else if (selectedButton == 'Button 2') {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CurricularActivityScreen(),
//                           ),
//                         );
//                       } else if (selectedButton == 'Button 3') {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => SportsScreen()),
//                         );
//                       } else if (selectedButton == 'button 4') {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => NCCandNSSActivityScreen(),
//                           ),
//                         );
//                       }
//                     } else {
//                       print(MediaQuery.sizeOf(context).height);
//                       print(MediaQuery.sizeOf(context).width);
//
//                       print('Please select a button.');
//                     }
//                   },
//                   child: Text(
//                     'Next',
//                     style: GoogleFonts.kufam(
//                         color: Color(0xff1E192E),
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ),
//               ],
//             ),
//           ),
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
//                       AssetImage('images/CSE_MAIT_FULL_LOGO_TEST1.png'),
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
//               //         Size(70, 40.0),
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
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xFF13E9DC),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               minimumSize: Size(70, 40.0),
//             ),
//             onPressed: () async {
//               // Close the drawer
//               Navigator.pop(context);
//
//               // Remove user details from SharedPreferences
//               await clearSavedCredentials();
//
//               // Navigate to the login screen
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginScreen()),
//               );
//             },
//             child: Text(
//               'Log out',
//               style: GoogleFonts.kufam(
//                   color: Color(0xff1E192E),
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500
//               ),
//             ),
//           ),
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
import 'package:majorproject/StudentActivities/co-curricular_activity_screen.dart';
import 'package:majorproject/main.dart';
import 'package:majorproject/teacher_data_sheet_screen.dart';
import 'package:majorproject/teacher_main_screen.dart';
import 'package:majorproject/student_data_sheet_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'StudentActivities/sports_screen.dart';
import 'StudentActivities/co-curricular_folder/community_service.dart';
import 'StudentActivities/ncc_nss_activity_screen.dart';

class StudentSelectionScreen extends StatefulWidget {
  @override
  _StudentSelectionScreenState createState() => _StudentSelectionScreenState();
}

class _StudentSelectionScreenState extends State<StudentSelectionScreen> {
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
              height: MediaQuery.sizeOf(context).height*0.25,
              width: MediaQuery.sizeOf(context)
                  .width, // Adjust the height as needed
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(

                  height: MediaQuery.sizeOf(context).height*0.1,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset('images/drawer.png',
                        width: 30.0,
                        height: 30.0,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width*0.2,
                    ),
                    Text(
                      'STUDENT',
                      style: GoogleFonts.kufam(
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                          color: Color(0xff0CECDA)),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.05,
                ),
                Center(
                    child: Image.asset(
                      'images/student.png',
                      scale: 3,
                    )),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),

                // Buttons
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Button 1';
                    });
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(0.9 * MediaQuery.of(context).size.width,MediaQuery.sizeOf(context).height*0.059,),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          // Pressed color
                          return Color.fromRGBO(12, 236, 218, 0.5);
                        } else if (states.contains(MaterialState.selected) ||
                            selectedButton == 'Button 1') {
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
                        borderRadius:
                        BorderRadius.circular(8.0), // Set the border radius
                        side: BorderSide(
                            color: Color(0xFF0CECDA)), // Set the border color
                      ),
                    ),
                  ),
                  child: Text('Academic Activity',
                    style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.025,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Button 2';
                    });
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(0.9 * MediaQuery.of(context).size.width,MediaQuery.sizeOf(context).height*0.059,),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          // Pressed color
                          return Color.fromRGBO(12, 236, 218, 0.5);
                        } else if (states.contains(MaterialState.selected) ||
                            selectedButton == 'Button 2') {
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
                        borderRadius:
                        BorderRadius.circular(8.0), // Set the border radius
                        side: BorderSide(
                            color: Color(0xFF0CECDA)), // Set the border color
                      ),
                    ),
                  ),
                  child: Text('Co-curricular Activity',
                    style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.025,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Button 3';
                    });
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(0.9 * MediaQuery.of(context).size.width,MediaQuery.sizeOf(context).height*0.059,),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          // Pressed color
                          return Color.fromRGBO(12, 236, 218, 0.5);
                        } else if (states.contains(MaterialState.selected) ||
                            selectedButton == 'Button 3') {
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
                        borderRadius:
                        BorderRadius.circular(8.0), // Set the border radius
                        side: BorderSide(
                            color: Color(0xFF0CECDA)), // Set the border color
                      ),
                    ),
                  ),
                  child: Text('Sports',
                    style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.025,
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'button 4';
                    });
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(0.9 * MediaQuery.of(context).size.width,MediaQuery.sizeOf(context).height*0.059,),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed) ||
                            selectedButton == 'button 4') {
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
                        borderRadius:
                        BorderRadius.circular(8.0), // Set the border radius
                        side: BorderSide(color: Color(0xFF0CECDA)),
                      ),
                    ),
                  ),
                  child: Text('NCC/NSS',
                    style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                ),

                SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF13E9DC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    minimumSize:
                    Size(0.9 * MediaQuery.of(context).size.width,MediaQuery.sizeOf(context).height*0.059,),
                  ),
                  onPressed: () {
                    if (selectedButton.isNotEmpty) {
                      if (selectedButton == 'Button 1') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AcademicScreen(),
                          ),
                        );
                      } else if (selectedButton == 'Button 2') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CurricularActivityScreen(),
                          ),
                        );
                      } else if (selectedButton == 'Button 3') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SportsScreen()),
                        );
                      } else if (selectedButton == 'button 4') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NCCandNSSActivityScreen(),
                          ),
                        );
                      }
                    } else {
                      print(MediaQuery.sizeOf(context).height);
                      print(MediaQuery.sizeOf(context).width);

                      print('Please select a button.');
                    }
                  },
                  child: Text(
                    'Next',
                    style: GoogleFonts.kufam(
                        color: Color(0xff1E192E),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
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
              //         AssetImage('images/CSE_MAIT_FULL_LOGO_TEST1.png'),
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
              //         Size(70, 40.0),
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
