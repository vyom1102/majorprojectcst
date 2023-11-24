
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/teacher_main_screen.dart';
import 'package:majorproject/student_data_sheet_screen.dart';

class StudentSelectionScreen extends StatefulWidget {
  @override
  _StudentSelectionScreenState createState() => _StudentSelectionScreenState();
}

class _StudentSelectionScreenState extends State<StudentSelectionScreen> {
  String selectedButton = '';

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
              width: MediaQuery.sizeOf(context).width,// Adjust the height as needed
            ),
          ),
          Column(

            children: [
              SizedBox(height: 100,),
              Text('STUDENT',style: GoogleFonts.kufam(fontWeight: FontWeight.w600,fontSize: 26,color: Color(0xff0CECDA)),),
             SizedBox(height: 20,),
              Center(child: Image.asset('images/student.png', scale: 3, )),
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
                child: Text('Academic Activity'),
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
                child: Text('Co-curricular Activity'),
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
                child: Text('Sports'),
              ),
              SizedBox(height: 20,),

              ElevatedButton(
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
                child: Text('NCC/NSS'),
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