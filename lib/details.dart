import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/detailScreens/StudentData/Acadmeic/student_competition.dart';
import 'package:majorproject/detailScreens/StudentData/Acadmeic/student_course.dart';
import 'package:majorproject/detailScreens/StudentData/Acadmeic/student_higherstudies.dart';
import 'package:majorproject/detailScreens/StudentData/Acadmeic/student_result.dart';
import 'package:majorproject/detailScreens/StudentData/Acadmeic/student_startup.dart';
import 'package:majorproject/detailScreens/StudentData/Co-CurricularData/Cultural/Student_Cultural_Organised.dart';
import 'package:majorproject/detailScreens/StudentData/Co-CurricularData/Technical/Student_tech_attended.dart';
import 'package:majorproject/detailScreens/StudentData/Co-CurricularData/Technical/Student_tech_organised.dart';
import 'package:majorproject/detailScreens/StudentData/Sports/student_intercollege.dart';
import 'package:majorproject/detailScreens/StudentData/Sports/student_intracollege.dart';
import 'package:majorproject/detailScreens/StudentData/student_personaldetail.dart';
import 'package:majorproject/detailScreens/StudentData/Acadmeic/student_training.dart';

import 'detailScreens/StudentData/Acadmeic/student_placement.dart';
import 'detailScreens/StudentData/Acadmeic/student_seminar.dart';
import 'detailScreens/StudentData/Co-CurricularData/CommunityService/Student_Community_Attended.dart';
import 'detailScreens/StudentData/Co-CurricularData/CommunityService/Student_Community_Organised.dart';
import 'detailScreens/StudentData/Co-CurricularData/Cultural/Student_Cultural_Attended.dart';
import 'detailScreens/StudentData/Co-CurricularData/Drama/Student_Drama_Attended.dart';
import 'detailScreens/StudentData/Co-CurricularData/Drama/Student_Drama_Organised.dart';



class Details extends StatelessWidget {
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height*0.04,),
                  Center(child: Text('Details',style: GoogleFonts.kufam(fontWeight: FontWeight.w600,fontSize: 26,color: Color(0xff0CECDA)),)),

                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        Size(0.9 * MediaQuery.of(context).size.width, 48.0),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {

                          return Color(0xff13292B);

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
                          builder: (context) =>
                          StudentList(),
                        ),
                      );
                    },
                    child: Text('Student Personal Details' ,style: GoogleFonts.kufam(color: Color(0xFF0CECDA),fontSize: 16,fontWeight: FontWeight.w500),),),
                  SizedBox(height: 15,),

                  // Container(
                  //   color: Color(0xff13292B),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.only(top: 18.0,left: 18,bottom: 8),
                  //               child: Text(
                  //                 'Academic Activity',
                  //                 style: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.white
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               padding: EdgeInsets.all(10.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //                 children: [
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.model_training, color: Colors.white),
                  //                           onPressed: () {
                  //                             Navigator.push(
                  //                               context,
                  //                               MaterialPageRoute(
                  //                                 builder: (context) =>
                  //                                     StudentTrainingList(),
                  //                               ),
                  //                             );
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Training', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.school, color: Colors.white),
                  //                           onPressed: () {
                  //                             Navigator.push(
                  //                               context,
                  //                               MaterialPageRoute(
                  //                                 builder: (context) =>
                  //                                     StudentCourseList(),
                  //                               ),
                  //                             );
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Courses', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.assignment, color: Colors.white),
                  //                           onPressed: () {
                  //                             Navigator.push(
                  //                               context,
                  //                               MaterialPageRoute(
                  //                                 builder: (context) =>
                  //                                     StudentResultList(),
                  //                               ),
                  //                             );
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Result', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.emoji_events, color: Colors.white),
                  //                           onPressed: () {
                  //                             Navigator.push(
                  //                               context,
                  //                               MaterialPageRoute(
                  //                                 builder: (context) =>
                  //                                     StudentCompetitionScreen(),
                  //                               ),
                  //                             );
                  //                           },
                  //                         ),
                  // ),
                  //                         Padding(
                  //                           padding: const EdgeInsets.only(top:4.0),
                  //                           child: Text('Competition', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                         ),
                  //
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Container(
                  //               padding: EdgeInsets.all(10.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //                 children: [
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.event, color: Colors.white),
                  //                           onPressed: () {
                  //                             Navigator.push(
                  //                               context,
                  //                               MaterialPageRoute(
                  //                                 builder: (context) =>
                  //                                     StudentSeminarList(),
                  //                               ),
                  //                             );
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Seminar', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.business, color: Colors.white),
                  //                           onPressed: () {
                  //                             Navigator.push(
                  //                               context,
                  //                               MaterialPageRoute(
                  //                                 builder: (context) =>
                  //                                     StudentStartupList(),
                  //                               ),
                  //                             );
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Start Up', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.work, color: Colors.white),
                  //                           onPressed: () {
                  //                             Navigator.push(
                  //                               context,
                  //                               MaterialPageRoute(
                  //                                 builder: (context) =>
                  //                                     StudentPlacementList(),
                  //                               ),
                  //                             );
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Placement', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.school_outlined, color: Colors.white),
                  //                           onPressed: () {
                  //                             Navigator.push(
                  //                               context,
                  //                               MaterialPageRoute(
                  //                                 builder: (context) =>
                  //                                     StudentStudiesList(),
                  //                               ),
                  //                             );
                  //                           },
                  //                         ),
                  // ),
                  //                         Padding(
                  //                           padding: const EdgeInsets.only(top:4.0),
                  //                           child: Text('Higher Study', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                         ),
                  //
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //
                  // SizedBox(height: 15,),
                  //
                  // Container(
                  //   color: Color(0xff13292B),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.only(top: 18.0,left: 18,bottom: 8),
                  //               child: Text(
                  //                 'Co-curricular Activity (Society)',
                  //                 style: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.white
                  //                 ),
                  //               ),
                  //             ),
                  //             Column(
                  //
                  //               // crossAxisAlignment: CrossAxisAlignment.center,
                  //               children: [
                  //
                  //                 Row(
                  //                   children: [
                  //                     SizedBox(width: 40,),
                  //                     Text('Ogranised', style: TextStyle(
                  //                         fontSize: 18,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Colors.white
                  //                     ),),
                  //                   ],
                  //                 ),
                  //                 Container(
                  //                   padding: EdgeInsets.all(10.0),
                  //                   child: Row(
                  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                     children: [
                  //                       Column(
                  //                         children: [
                  //                           Container(
                  //                             color: Color(0x1A0CECDA),
                  //                             child: IconButton(
                  //                               icon: Icon(Icons.computer, color: Colors.white),
                  //                               onPressed: () {
                  //                                 Navigator.push(
                  //                                   context,
                  //                                   MaterialPageRoute(
                  //                                     builder: (context) =>
                  //                                         StudentTechOrganisedList(),
                  //                                   ),
                  //                                 );
                  //                               },
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top:4.0),
                  //                             child: Text('Technical', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       Column(
                  //                         children: [
                  //                           Container(
                  //                             color: Color(0x1A0CECDA),
                  //                             child: IconButton(
                  //                               icon: Icon(Icons.sports_soccer, color: Colors.white),
                  //                               onPressed: () {
                  //                                 Navigator.push(
                  //                                   context,
                  //                                   MaterialPageRoute(
                  //                                     builder: (context) =>
                  //                                         StudentCulEventOrganisedList(),
                  //                                   ),
                  //                                 );
                  //                               },
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top:4.0),
                  //                             child: Text('Cultural', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       Column(
                  //                         children: [
                  //                           Container(
                  //                             color: Color(0x1A0CECDA),
                  //                             child: IconButton(
                  //                               icon: Icon(Icons.music_note, color: Colors.white),
                  //                               onPressed: () {
                  //                                 // Add functionality for the icon button
                  //                               },
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top:4.0),
                  //                             child: Text('Musical', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       Column(
                  //                         children: [
                  //                           Container(
                  //                             color: Color(0x1A0CECDA),
                  //                             child: IconButton(
                  //                               icon: Icon(Icons.music_video, color: Colors.white),
                  //                               onPressed: () {
                  //                                 // Add functionality for the icon button
                  //                               },
                  //                             ),
                  // ),
                  //                             Padding(
                  //                               padding: const EdgeInsets.only(top:4.0),
                  //                               child: Text('Dance', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                             ),
                  //
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 Row(
                  //                   children: [
                  //                     SizedBox(width: 40,),
                  //                     Text('Attended', style: TextStyle(
                  //                         fontSize: 18,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Colors.white
                  //                     ),),
                  //                   ],
                  //                 ),
                  //                 Container(
                  //                   padding: EdgeInsets.all(10.0),
                  //                   child: Row(
                  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                     children: [
                  //                       Column(
                  //                         children: [
                  //                           Container(
                  //                             color: Color(0x1A0CECDA),
                  //                             child: IconButton(
                  //                               icon: Icon(Icons.computer, color: Colors.white),
                  //                               onPressed: () {
                  //                                 Navigator.push(
                  //                                   context,
                  //                                   MaterialPageRoute(
                  //                                     builder: (context) =>
                  //                                         StudentTechEventParticipationList(),
                  //                                   ),
                  //                                 );
                  //                               },
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top:4.0),
                  //                             child: Text('Technical', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       Column(
                  //                         children: [
                  //                           Container(
                  //                             color: Color(0x1A0CECDA),
                  //                             child: IconButton(
                  //                               icon: Icon(Icons.sports_soccer, color: Colors.white),
                  //                               onPressed: () {
                  //                                 // Add functionality for the icon button
                  //                               },
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top:4.0),
                  //                             child: Text('Non-Technical', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       Column(
                  //                         children: [
                  //                           Container(
                  //                             color: Color(0x1A0CECDA),
                  //                             child: IconButton(
                  //                               icon: Icon(Icons.music_note, color: Colors.white),
                  //                               onPressed: () {
                  //                                 // Add functionality for the icon button
                  //                               },
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top:4.0),
                  //                             child: Text('Musical', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       Column(
                  //                         children: [
                  //                           Container(
                  //                             color: Color(0x1A0CECDA),
                  //                             child: IconButton(
                  //                               icon: Icon(Icons.music_video, color: Colors.white),
                  //                               onPressed: () {
                  //                                 // Add functionality for the icon button
                  //                               },
                  //                             ),
                  // ),
                  //                             Padding(
                  //                               padding: const EdgeInsets.only(top:4.0),
                  //                               child: Text('Dance', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                             ),
                  //
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //
                  // SizedBox(height: 15,),
                  //
                  // Container(
                  //   color: Color(0xff13292B),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.only(top: 18.0,left: 18,bottom: 8),
                  //               child: Text(
                  //                 'Sports',
                  //                 style: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.white
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               padding: EdgeInsets.all(10.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                 children: [
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.sports_baseball, color: Colors.white),
                  //                           onPressed: () {
                  //                             Navigator.push(
                  //                               context,
                  //                               MaterialPageRoute(
                  //                                 builder: (context) =>
                  //                                     StudentInterList(),
                  //                               ),
                  //                             );
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Intercollege', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.sports_volleyball, color: Colors.white),
                  //                           onPressed: () {
                  //                             Navigator.push(
                  //                               context,
                  //                               MaterialPageRoute(
                  //                                 builder: (context) =>
                  //                                     StudentIntraList(),
                  //                               ),
                  //                             );
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Intracollege', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //
                  // SizedBox(height: 15,),
                  //
                  // Container(
                  //   color: Color(0xff13292B),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.only(top: 18.0,left: 18,bottom: 8),
                  //               child: Text(
                  //                 'NCC/NSS',
                  //                 style: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.white
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               padding: EdgeInsets.all(10.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                 children: [
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.male, color: Colors.white),
                  //                           onPressed: () {
                  //                             // Add functionality for the first icon button
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Male', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.female, color: Colors.white),
                  //                           onPressed: () {
                  //                             // Add functionality for the first icon button
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Female', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.group, color: Colors.white),
                  //                           onPressed: () {
                  //                             // Add functionality for the first icon button
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Co-ed', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    color: Color(0xff13292B),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0,left: 18,bottom: 8),
                                child: Text(
                                  'Academic Activity',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Container(
                                            color: Color(0x1A0CECDA),
                                            child: IconButton(
                                              icon: Icon(Icons.model_training, color: Colors.white),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        StudentTrainingList(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Training', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Container(
                                            color: Color(0x1A0CECDA),
                                            child: IconButton(
                                              icon: Icon(Icons.school, color: Colors.white),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        StudentCourseList(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Courses', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Container(
                                            color: Color(0x1A0CECDA),
                                            child: IconButton(
                                              icon: Icon(Icons.assignment, color: Colors.white),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        StudentResultList(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Result', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Container(
                                            color: Color(0x1A0CECDA),
                                            child: IconButton(
                                              icon: Icon(Icons.emoji_events, color: Colors.white),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        StudentCompetitionScreen(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Competition', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    // Column(
                                    //   children: [
                                    //     Container(
                                    //       color: Color(0x1A0CECDA),
                                    //       child: IconButton(
                                    //         icon: Icon(Icons.event, color: Colors.white),
                                    //         onPressed: () {
                                    //           Navigator.push(
                                    //             context,
                                    //             MaterialPageRoute(
                                    //               builder: (context) =>
                                    //                   StudentSeminarList(),
                                    //             ),
                                    //           );
                                    //         },
                                    //       ),
                                    //     ),
                                    //     Padding(
                                    //       padding: const EdgeInsets.only(top:4.0),
                                    //       child: Text('Seminar', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                    //     ),
                                    //   ],
                                    // ),
                                    // Column(
                                    //   children: [
                                    //     Container(
                                    //       color: Color(0x1A0CECDA),
                                    //       child: IconButton(
                                    //         icon: Icon(Icons.business, color: Colors.white),
                                    //         onPressed: () {
                                    //           Navigator.push(
                                    //             context,
                                    //             MaterialPageRoute(
                                    //               builder: (context) =>
                                    //                   StudentStartupList(),
                                    //             ),
                                    //           );
                                    //         },
                                    //       ),
                                    //     ),
                                    //     Padding(
                                    //       padding: const EdgeInsets.only(top:4.0),
                                    //       child: Text('Start Up', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                    //     ),
                                    //   ],
                                    // ),
                                    // Column(
                                    //   children: [
                                    //     Container(
                                    //       color: Color(0x1A0CECDA),
                                    //       child: IconButton(
                                    //         icon: Icon(Icons.work, color: Colors.white),
                                    //         onPressed: () {
                                    //           Navigator.push(
                                    //             context,
                                    //             MaterialPageRoute(
                                    //               builder: (context) =>
                                    //                   StudentPlacementList(),
                                    //             ),
                                    //           );
                                    //         },
                                    //       ),
                                    //     ),
                                    //     Padding(
                                    //       padding: const EdgeInsets.only(top:4.0),
                                    //       child: Text('Placement', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                    //     ),
                                    //   ],
                                    // ),
                                    // Column(
                                    //   children: [
                                    //     Container(
                                    //       color: Color(0x1A0CECDA),
                                    //       child: IconButton(
                                    //         icon: Icon(Icons.school_outlined, color: Colors.white),
                                    //         onPressed: () {
                                    //           Navigator.push(
                                    //             context,
                                    //             MaterialPageRoute(
                                    //               builder: (context) =>
                                    //                   StudentStudiesList(),
                                    //             ),
                                    //           );
                                    //         },
                                    //       ),
                                    //     ),
                                    //     Padding(
                                    //       padding: const EdgeInsets.only(top:4.0),
                                    //       child: Text('Higher Study', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                    //     ),
                                    //
                                    //   ],
                                    // ),
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10), // Adjust the value to change the roundness of the corners
                                          child: Container(
                                            color: Color(0x1A0CECDA),
                                            child: IconButton(
                                              icon: Icon(Icons.event, color: Colors.white),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => StudentSeminarList(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('Seminar', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10), // Adjust the value to change the roundness of the corners
                                          child: Container(
                                            color: Color(0x1A0CECDA),
                                            child: IconButton(
                                              icon: Icon(Icons.business, color: Colors.white),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => StudentStartupList(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('Start Up', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10), // Adjust the value to change the roundness of the corners
                                          child: Container(
                                            color: Color(0x1A0CECDA),
                                            child: IconButton(
                                              icon: Icon(Icons.work, color: Colors.white),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => StudentPlacementList(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('Placement', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10), // Adjust the value to change the roundness of the corners
                                          child: Container(
                                            color: Color(0x1A0CECDA),
                                            child: IconButton(
                                              icon: Icon(Icons.school_outlined, color: Colors.white),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => StudentStudiesList(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('Higher Study', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  Container(
                    color: Color(0xff13292B),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0,left: 18,bottom: 8),
                                child: Text(
                                  'Co-curricular Activity (Society)',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                              Column(

                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Row(
                                    children: [
                                      SizedBox(width: 40,),
                                      Text('Ogranised', style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),),
                                    ],
                                  ),
                                  // Container(
                                  //   padding: EdgeInsets.all(10.0),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  //     children: [
                                  //       Column(
                                  //         children: [
                                  //           Container(
                                  //             color: Color(0x1A0CECDA),
                                  //             child: IconButton(
                                  //               icon: Icon(Icons.code, color: Colors.white),
                                  //               onPressed: () {
                                  //                 Navigator.push(
                                  //                   context,
                                  //                   MaterialPageRoute(
                                  //                     builder: (context) =>
                                  //                         StudentTechOrganisedList(),
                                  //                   ),
                                  //                 );
                                  //               },
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(top:4.0),
                                  //             child: Text('Technical', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       Column(
                                  //         children: [
                                  //           Container(
                                  //             color: Color(0x1A0CECDA),
                                  //             child: IconButton(
                                  //               icon: Icon(Icons.art_track, color: Colors.white),
                                  //               onPressed: () {
                                  //                 Navigator.push(
                                  //                   context,
                                  //                   MaterialPageRoute(
                                  //                     builder: (context) =>
                                  //                         StudentCulEventOrganisedList(),
                                  //                   ),
                                  //                 );
                                  //               },
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(top:4.0),
                                  //             child: Text('Cultural', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       Column(
                                  //         children: [
                                  //           Container(
                                  //             color: Color(0x1A0CECDA),
                                  //             child: IconButton(
                                  //               icon: Icon(Icons.group, color: Colors.white),
                                  //               onPressed: () {
                                  //                 Navigator.push(
                                  //                   context,
                                  //                   MaterialPageRoute(
                                  //                     builder: (context) =>
                                  //                         StudentCommEventOrganiseList(),
                                  //                   ),
                                  //                 );
                                  //               },
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(top:4.0),
                                  //             child: Text('Community', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       Column(
                                  //         children: [
                                  //           Container(
                                  //             color: Color(0x1A0CECDA),
                                  //             child: IconButton(
                                  //               icon: Icon(Icons.more_horiz, color: Colors.white),
                                  //               onPressed: () {
                                  //                 Navigator.push(
                                  //                   context,
                                  //                   MaterialPageRoute(
                                  //                     builder: (context) =>
                                  //                         StudentDramaEventOrganisedList(),
                                  //                   ),
                                  //                 );
                                  //               },
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(top:4.0),
                                  //             child: Text('Others', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                  //           ),
                                  //
                                  //         ],
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10), // Adjust the value to change the roundness of the corners
                                              child: Container(
                                                color: Color(0x1A0CECDA),
                                                child: IconButton(
                                                  icon: Icon(Icons.code, color: Colors.white),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => StudentTechOrganisedList(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 4.0),
                                              child: Text('Technical', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10), // Adjust the value to change the roundness of the corners
                                              child: Container(
                                                color: Color(0x1A0CECDA),
                                                child: IconButton(
                                                  icon: Icon(Icons.art_track, color: Colors.white),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => StudentCulEventOrganisedList(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 4.0),
                                              child: Text('Cultural', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10), // Adjust the value to change the roundness of the corners
                                              child: Container(
                                                color: Color(0x1A0CECDA),
                                                child: IconButton(
                                                  icon: Icon(Icons.group, color: Colors.white),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => StudentCommEventOrganiseList(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 4.0),
                                              child: Text('Community', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10), // Adjust the value to change the roundness of the corners
                                              child: Container(
                                                color: Color(0x1A0CECDA),
                                                child: IconButton(
                                                  icon: Icon(Icons.more_horiz, color: Colors.white),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => StudentDramaEventOrganisedList(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 4.0),
                                              child: Text('Others', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      SizedBox(width: 40,),
                                      Text('Attended', style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),),
                                    ],
                                  ),
                                  // Container(
                                  //   padding: EdgeInsets.all(10.0),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  //     children: [
                                  //       Column(
                                  //         children: [
                                  //           Container(
                                  //             color: Color(0x1A0CECDA),
                                  //             child: IconButton(
                                  //               icon: Icon(Icons.code, color: Colors.white),
                                  //               onPressed: () {
                                  //                 Navigator.push(
                                  //                   context,
                                  //                   MaterialPageRoute(
                                  //                     builder: (context) =>
                                  //                         StudentTechEventParticipationList(),
                                  //                   ),
                                  //                 );
                                  //               },
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(top:4.0),
                                  //             child: Text('Technical', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       Column(
                                  //         children: [
                                  //           Container(
                                  //             color: Color(0x1A0CECDA),
                                  //             child: IconButton(
                                  //               icon: Icon(Icons.art_track, color: Colors.white),
                                  //               onPressed: () {
                                  //                 Navigator.push(
                                  //                   context,
                                  //                   MaterialPageRoute(
                                  //                     builder: (context) =>
                                  //                         StudentCulEventParticipationList(),
                                  //                   ),
                                  //                 );
                                  //               },
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(top:4.0),
                                  //             child: Text('Cultural', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       Column(
                                  //         children: [
                                  //           Container(
                                  //             color: Color(0x1A0CECDA),
                                  //             child: IconButton(
                                  //               icon: Icon(Icons.group, color: Colors.white),
                                  //               onPressed: () {
                                  //                 Navigator.push(
                                  //                   context,
                                  //                   MaterialPageRoute(
                                  //                     builder: (context) =>
                                  //                         StudentCommEventParticipationList(),
                                  //                   ),
                                  //                 );
                                  //               },
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(top:4.0),
                                  //             child: Text('Community', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       Column(
                                  //         children: [
                                  //           Container(
                                  //             color: Color(0x1A0CECDA),
                                  //             child: IconButton(
                                  //               icon: Icon(Icons.more_horiz, color: Colors.white),
                                  //               onPressed: () {
                                  //                 Navigator.push(
                                  //                   context,
                                  //                   MaterialPageRoute(
                                  //                     builder: (context) =>
                                  //                         StudentDramaEventParticipationList(),
                                  //                   ),
                                  //                 );
                                  //               },
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(top:4.0),
                                  //             child: Text('Others', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                  //           ),
                                  //
                                  //         ],
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10), // Adjust the value to change the roundness of the corners
                                              child: Container(
                                                color: Color(0x1A0CECDA),
                                                child: IconButton(
                                                  icon: Icon(Icons.code, color: Colors.white),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => StudentTechEventParticipationList(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 4.0),
                                              child: Text('Technical', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10), // Adjust the value to change the roundness of the corners
                                              child: Container(
                                                color: Color(0x1A0CECDA),
                                                child: IconButton(
                                                  icon: Icon(Icons.art_track, color: Colors.white),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => StudentCulEventParticipationList(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 4.0),
                                              child: Text('Cultural', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10), // Adjust the value to change the roundness of the corners
                                              child: Container(
                                                color: Color(0x1A0CECDA),
                                                child: IconButton(
                                                  icon: Icon(Icons.group, color: Colors.white),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => StudentCommEventParticipationList(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 4.0),
                                              child: Text('Community', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10), // Adjust the value to change the roundness of the corners
                                              child: Container(
                                                color: Color(0x1A0CECDA),
                                                child: IconButton(
                                                  icon: Icon(Icons.more_horiz, color: Colors.white),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => StudentDramaEventParticipationList(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 4.0),
                                              child: Text('Others', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Container(
                  //   color: Color(0xff13292B),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.only(top: 18.0, left: 18, bottom: 8),
                  //               child: Text(
                  //                 'Co-curricular Activity (Society)',
                  //                 style: TextStyle(
                  //                   fontSize: 18,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Colors.white,
                  //                 ),
                  //               ),
                  //             ),
                  //             Column(
                  //               children: [
                  //                 Row(
                  //                   children: [
                  //                     SizedBox(width: 40),
                  //                     Text(
                  //                       'Ogranised',
                  //                       style: TextStyle(
                  //                         fontSize: 18,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Colors.white,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 Container(
                  //                   padding: EdgeInsets.all(10.0),
                  //                   child: Row(
                  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                     children: [
                  //                       Column(
                  //                         children: [
                  //                           IconButton(
                  //                             icon: Icon(Icons.code, color: Colors.white), // Change icon to code icon
                  //                             onPressed: () {
                  //                               Navigator.push(
                  //                                 context,
                  //                                 MaterialPageRoute(
                  //                                   builder: (context) => StudentTechOrganisedList(),
                  //                                 ),
                  //                               );
                  //                             },
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top: 4.0),
                  //                             child: Text('Technical', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       Column(
                  //                         children: [
                  //                           IconButton(
                  //                             icon: Icon(Icons.art_track, color: Colors.white), // Change icon to art_track icon
                  //                             onPressed: () {
                  //                               Navigator.push(
                  //                                 context,
                  //                                 MaterialPageRoute(
                  //                                   builder: (context) => StudentCulEventOrganisedList(),
                  //                                 ),
                  //                               );
                  //                             },
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top: 4.0),
                  //                             child: Text('Cultural', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       Column(
                  //                         children: [
                  //                           IconButton(
                  //                             icon: Icon(Icons.group, color: Colors.white), // Change icon to group icon
                  //                             onPressed: () {
                  //                               Navigator.push(
                  //                                 context,
                  //                                 MaterialPageRoute(
                  //                                   builder: (context) => StudentCommEventOrganiseList(),
                  //                                 ),
                  //                               );
                  //                             },
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top: 4.0),
                  //                             child: Text('Community', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       Column(
                  //                         children: [
                  //                           IconButton(
                  //                             icon: Icon(Icons.more_horiz, color: Colors.white), // Change icon to more_horiz icon
                  //                             onPressed: () {
                  //                               Navigator.push(
                  //                                 context,
                  //                                 MaterialPageRoute(
                  //                                   builder: (context) => StudentDramaEventOrganisedList(),
                  //                                 ),
                  //                               );
                  //                             },
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top: 4.0),
                  //                             child: Text('Others', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 Row(
                  //                   children: [
                  //                     SizedBox(width: 40),
                  //                     Text(
                  //                       'Attended',
                  //                       style: TextStyle(
                  //                         fontSize: 18,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Colors.white,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 Container(
                  //                   padding: EdgeInsets.all(10.0),
                  //                   child: Row(
                  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                     children: [
                  //                       Column(
                  //                         children: [
                  //                           IconButton(
                  //                             icon: Icon(Icons.code, color: Colors.white), // Change icon to code icon
                  //                             onPressed: () {
                  //                               Navigator.push(
                  //                                 context,
                  //                                 MaterialPageRoute(
                  //                                   builder: (context) => StudentTechEventParticipationList(),
                  //                                 ),
                  //                               );
                  //                             },
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top: 4.0),
                  //                             child: Text('Technical', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       Column(
                  //                         children: [
                  //                           IconButton(
                  //                             icon: Icon(Icons.art_track, color: Colors.white), // Change icon to art_track icon
                  //                             onPressed: () {
                  //                               Navigator.push(
                  //                                 context,
                  //                                 MaterialPageRoute(
                  //                                   builder: (context) => StudentCulEventParticipationList(),
                  //                                 ),
                  //                               );
                  //                             },
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top: 4.0),
                  //                             child: Text('Cultural', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       Column(
                  //                         children: [
                  //                           IconButton(
                  //                             icon: Icon(Icons.group, color: Colors.white), // Change icon to group icon
                  //                             onPressed: () {
                  //                               Navigator.push(
                  //                                 context,
                  //                                 MaterialPageRoute(
                  //                                   builder: (context) => StudentCommEventParticipationList(),
                  //                                 ),
                  //                               );
                  //                             },
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top: 4.0),
                  //                             child: Text('Community', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       Column(
                  //                         children: [
                  //                           IconButton(
                  //                             icon: Icon(Icons.more_horiz, color: Colors.white), // Change icon to more_horiz icon
                  //                             onPressed: () {
                  //                               Navigator.push(
                  //                                 context,
                  //                                 MaterialPageRoute(
                  //                                   builder: (context) => StudentDramaEventParticipationList(),
                  //                                 ),
                  //                               );
                  //                             },
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(top: 4.0),
                  //                             child: Text('Others', style: GoogleFonts.kufam(color: Colors.white, fontSize: 12)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),


                  SizedBox(height: 15,),

                  Container(
                    color: Color(0xff13292B),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0,left: 18,bottom: 8),
                                child: Text(
                                  'Sports',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Container(
                                              color: Color(0x1A0CECDA),
                                              child: IconButton(
                                                icon: Icon(Icons.sports_baseball, color: Colors.white),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          StudentInterList(),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:4.0),
                                            child: Text('Intercollege', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Container(
                                              color: Color(0x1A0CECDA),
                                              child: IconButton(
                                                icon: Icon(Icons.sports_volleyball, color: Colors.white),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          StudentIntraList(),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:4.0),
                                            child: Text('Intracollege', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  Container(
                    color: Color(0xff13292B),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0,left: 18,bottom: 8),
                                child: Text(
                                  'NCC/NSS',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),

                                          child: Container(
                                            color: Color(0x1A0CECDA),
                                            child: IconButton(
                                              icon: Icon(Icons.male, color: Colors.white),
                                              onPressed: () {
                                                // Add functionality for the first icon button
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Male', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),

                                          child: Container(
                                            color: Color(0x1A0CECDA),
                                            child: IconButton(
                                              icon: Icon(Icons.female, color: Colors.white),
                                              onPressed: () {
                                                // Add functionality for the first icon button
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Female', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),

                                          child: Container(
                                            color: Color(0x1A0CECDA),
                                            child: IconButton(
                                              icon: Icon(Icons.group, color: Colors.white),
                                              onPressed: () {
                                                // Add functionality for the first icon button
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Co-ed', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
