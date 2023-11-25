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
import 'package:majorproject/teacher_main_screen.dart';
import 'package:majorproject/student_data_sheet_screen.dart';

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
              height:150,
              width: MediaQuery.sizeOf(context).width,// Adjust the height as needed
            ),
          ),
          Column(


            children: [
              SizedBox(height: 60,),
              Text('Academic Activity',style: GoogleFonts.kufam(fontWeight: FontWeight.w600,fontSize: 26,color: Color(0xff0CECDA)),),


            SizedBox(height: 20,),
              // Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
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
                          return Color(0xFF0CECDA);
                        } else if (states.contains(MaterialState.selected) || selectedButton == 'Button 1') {
                          // Selected color
                          return Color(0xFF0CECDA);
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
                  child: Text('Training'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
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
                          return Color(0xFF0CECDA);
                        } else if (states.contains(MaterialState.selected) || selectedButton == 'Button 2') {
                          // Selected color
                          return Color(0xFF0CECDA);
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
                  child: Text('Result'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
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
                          return Color(0xFF0CECDA);
                        } else if (states.contains(MaterialState.selected) || selectedButton == 'Button 3') {
                          // Selected color
                          return Color(0xFF0CECDA);
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
                  child: Text('Courses'),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'NCC/NSS';
                    });
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(0.9 * MediaQuery.of(context).size.width, 48.0),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed) || selectedButton == 'NCC/NSS') {
                          // Pressed or selected color
                          return Color(0xFF0CECDA);
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
                  child: Text('Seminar'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
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
                          return Color(0xFF0CECDA);
                        } else if (states.contains(MaterialState.selected) || selectedButton == 'Button 5') {
                          // Selected color
                          return Color(0xFF0CECDA);
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
                  child: Text('Competition'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
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
                          return Color(0xFF0CECDA);
                        } else if (states.contains(MaterialState.selected) || selectedButton == 'Button 6') {
                          // Selected color
                          return Color(0xFF0CECDA);
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
                  child: Text('Higher Studies'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
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
                          return Color(0xFF0CECDA);
                        } else if (states.contains(MaterialState.selected) || selectedButton == 'Button 7') {
                          // Selected color
                          return Color(0xFF0CECDA);
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
                  child: Text('Startup'),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
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
                        if (states.contains(MaterialState.pressed) || selectedButton == 'Button 8') {
                          // Pressed or selected color
                          return Color(0xFF0CECDA);
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
                  child: Text('Placement'),
                ),
              ),



              SizedBox(height: MediaQuery.sizeOf(context).height*0.08),


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
                          builder: (context) => AcademicScreen(),
                        ),
                      );
                    } else if (selectedButton == 'Button 2') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeacherSelectionScreen(),
                        ),
                      );
                    } else if (selectedButton == 'Button 3') {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => AcademicScreen(),
                      //   ),
                      // );

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => studentDataSheet()),
                      );
                    } else if (selectedButton == 'Button 4') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AcademicScreen(),
                        ),
                      );
                    }
                  } else {
                    // Show a message or handle the case when no button is selected.
                    print('Please select a button.');
                  }
                },
                child: Text('Next',style: GoogleFonts.kufam(color: Color(0xff1E192E),fontSize: 20,fontWeight: FontWeight.w500),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}