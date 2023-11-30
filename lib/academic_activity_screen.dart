// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class AcademicScreen extends StatelessWidget {
//   final List<String> buttonTitles = [
//     'Training',
//     'Result',
//     'Courses',
//     'Seminar',
//     'Competition',
//     'Higher Studies',
//     'Startup',
//     'Placement',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff21262E),
//       body: Stack(
//         children: [
//           Image.asset(
//             'images/Group 174.png', // Adjust this to your background image
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 40),
//                 Text(
//                   'Student',
//                   style: GoogleFonts.marcellus(
//                     color: Colors.white,
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//
//                 GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 16.0,
//                     mainAxisSpacing: 16.0,
//                   ),
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: buttonTitles.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
//                           foregroundColor: Colors.black,
//                           backgroundColor: Color(0xff1E94FF),
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(color: Colors.black),
//                             borderRadius: BorderRadius.circular(0),
//                           ),
//                         ),
//                         child: Text(buttonTitles[index],style: GoogleFonts.marcellus(fontSize: 22,),textAlign: TextAlign.center,),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/academic_folder/competition_screen.dart';
import 'package:majorproject/academic_folder/courses_screen.dart';
import 'package:majorproject/academic_folder/higher_studies_screen.dart';
import 'package:majorproject/academic_folder/placement_screen.dart';
import 'package:majorproject/academic_folder/result_screen.dart';
import 'package:majorproject/academic_folder/seminar_screen.dart';
import 'package:majorproject/academic_folder/startup_screen.dart';
import 'package:majorproject/academic_folder/training_screen.dart';
import 'package:majorproject/teacher_main_screen.dart';
import 'package:majorproject/student_data_sheet_screen.dart';
import 'package:majorproject/academic_folder/training_screen.dart';

class AcademicScreen extends StatefulWidget {
  @override
  _AcademicScreenState createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  String selectedButton = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141318),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              'images/bottom_container.png',
              fit: BoxFit.cover,
              height: 150,
              width: MediaQuery.sizeOf(context)
                  .width, // Adjust the height as needed
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                'Academic Activity',
                style: GoogleFonts.kufam(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                    color: Color(0xff0CECDA)),
              ),

              SizedBox(
                height: 20,
              ),
              // Buttons
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: ElevatedButton(
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
                  child: Text(
                    'Training',
                    style: GoogleFonts.kufam(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: ElevatedButton(
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
                  child: Text(
                    'Result',
                    style: GoogleFonts.kufam(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: ElevatedButton(
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
                  child: Text(
                    'Courses',
                    style: GoogleFonts.kufam(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Button 4';
                      // selectedButton = 'NCC/NSS';
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
                        } else if (states.contains(MaterialState.selected) ||
                            selectedButton == 'Button 4') {
                          // Selected color
                          return Color.fromRGBO(12, 236, 218, 0.5);
                        } else {
                          // Default color
                          return Colors.black;
                          // if (states.contains(MaterialState.pressed) || selectedButton == 'NCC/NSS') {
                          //   // Pressed or selected color
                          //   return Color(0xFF0CECDA);
                          // } else {
                          //   // Default color
                          //   return Colors.black;
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
                  child: Text(
                    'Seminar',
                    style: GoogleFonts.kufam(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Button 5';
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
                        } else if (states.contains(MaterialState.selected) ||
                            selectedButton == 'Button 5') {
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
                  child: Text(
                    'Competition',
                    style: GoogleFonts.kufam(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Button 6';
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
                        } else if (states.contains(MaterialState.selected) ||
                            selectedButton == 'Button 6') {
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
                  child: Text(
                    'Higher Studies',
                    style: GoogleFonts.kufam(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Button 7';
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
                        } else if (states.contains(MaterialState.selected) ||
                            selectedButton == 'Button 7') {
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
                  child: Text(
                    'Startup',
                    style: GoogleFonts.kufam(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'Button 8';
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
                        } else if (states.contains(MaterialState.selected) ||
                            selectedButton == 'Button 8') {
                          // Selected color
                          return Color.fromRGBO(12, 236, 218, 0.5);
                        } else {
                          // Default color
                          return Colors.black;
                        }
                        // if (states.contains(MaterialState.pressed)) {
                        // // Pressed color
                        // return Color.fromRGBO(12, 236, 218, 0.5);
                        //                     else if (states.contains(MaterialState.pressed) || selectedButton == 'Button 8') {
                        //                       // Pressed or selected color
                        //                       return Color.fromRGBO(12, 236, 218, 0.5);
                        //                     } else {
                        //                       // Default color
                        //                       return Colors.black;
                        //                     }
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
                  child: Text(
                    'Placement',
                    style: GoogleFonts.kufam(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF13E9DC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  minimumSize:
                      Size(0.9 * MediaQuery.of(context).size.width, 48.0),
                ),
                onPressed: () {
                  if (selectedButton.isNotEmpty) {
                    if (selectedButton == 'Button 1') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrainingScreen(),
                        ),
                      );
                    } else if (selectedButton == 'Button 2') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(),
                        ),
                      );
                    } else if (selectedButton == 'Button 3') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoursesScreen(),
                        ),
                      );
                    }
                    else if (selectedButton == 'Button 4') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeminarScreen(),
                        ),
                      );
                    }else if (selectedButton == 'Button 5') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompetitionScreen(),
                        ),
                      );
                    }else if (selectedButton == 'Button 6') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HigherStudiesScreen(),
                        ),
                      );
                    }else if (selectedButton == 'Button 7') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StartupScreen(),
                        ),
                      );
                    }else if (selectedButton == 'Button 8') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlacementScreen(),
                        ),
                      );
                    }
                  } else {
                    // Show a message or handle the case when no button is selected.
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
        ],
      ),
    );
  }
}
