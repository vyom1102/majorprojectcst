import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/StudentActivities/academic_folder/competition_screen.dart';
import 'package:majorproject/StudentActivities/academic_folder/courses_screen.dart';
import 'package:majorproject/StudentActivities/academic_folder/higher_studies_screen.dart';
import 'package:majorproject/StudentActivities/academic_folder/placement_screen.dart';
import 'package:majorproject/StudentActivities/academic_folder/result_screen.dart';
import 'package:majorproject/StudentActivities/academic_folder/seminar_screen.dart';
import 'package:majorproject/StudentActivities/academic_folder/startup_screen.dart';
import 'package:majorproject/StudentActivities/academic_folder/training_screen.dart';
import 'package:majorproject/StudentActivities/co-curricular_folder/others_screen.dart';
import 'package:majorproject/teacher_main_screen.dart';
import 'package:majorproject/student_data_sheet_screen.dart';
import 'package:majorproject/StudentActivities/academic_folder/training_screen.dart';

import 'co-curricular_folder/community_service.dart';
import 'co-curricular_folder/cultural_society.dart';
import 'co-curricular_folder/technical_society.dart';

class CurricularActivityScreen extends StatefulWidget {
  @override
  _CurricularActivityScreenState createState() => _CurricularActivityScreenState();
}

class _CurricularActivityScreenState extends State<CurricularActivityScreen> {
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
                'Co-Curricular Activity',
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
                    'Technical Society',
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
                    'Cultural Society',
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
                    'Community Service',
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
                    'Others',
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
                          builder: (context) => TechnicalSocietyScreen(),
                        ),
                      );
                    } else if (selectedButton == 'Button 2') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CulturalSocietyScreen(),
                        ),
                      );
                    }
                    else if (selectedButton == 'Button 3') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityServiceScreen(),
                        ),
                      );
                    }
                    else if (selectedButton == 'Button 4') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OthersScreen(),
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
