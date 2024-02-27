import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/admin/adminscreen.dart';
import 'package:majorproject/student_detail.dart';



class AdminHome extends StatelessWidget {
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
                              AdminScreen(),
                        ),
                      );
                    },
                    child: Text(' Personal Details' ,style: GoogleFonts.kufam(color: Color(0xFF0CECDA),fontSize: 16,fontWeight: FontWeight.w500),),),
                  SizedBox(height: 15,),
                  Text('Students',style: GoogleFonts.kufam(fontWeight: FontWeight.w600,fontSize: 26,color: Color(0xff0CECDA)),),

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
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.model_training, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
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
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.school, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
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
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.assignment, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
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
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.emoji_events, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
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
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.event, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Seminar', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.business, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Start Up', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.work, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Placement', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.school_outlined, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Higher Study', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
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
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.computer, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Technical', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.sports_soccer, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Non-Technical', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.music_note, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Musical', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.music_video, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0),
                                          child: Text('Dance', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
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
                                  'Sports',
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
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.sports_baseball, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the first icon button
                                            },
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
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.sports_volleyball, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the first icon button
                                            },
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
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.male, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the first icon button
                                            },
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
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.female, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the first icon button
                                            },
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
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.group, color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the first icon button
                                            },
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


                  Text('Teachers',style: GoogleFonts.kufam(fontWeight: FontWeight.w600,fontSize: 26,color: Color(0xff0CECDA)),),


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
                                padding: const EdgeInsets.only(
                                    top: 18.0, left: 18, bottom: 8),
                                child: Text(
                                  'Event Attended',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.local_activity,
                                                color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('Workshop',
                                              style: GoogleFonts.kufam(
                                                  color: Colors.white,
                                                  fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.school,
                                                color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('Conference',
                                              style: GoogleFonts.kufam(
                                                  color: Colors.white,
                                                  fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.event_note,
                                                color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('Seminar',
                                              style: GoogleFonts.kufam(
                                                  color: Colors.white,
                                                  fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.emoji_events,
                                                color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('FDP',
                                              style: GoogleFonts.kufam(
                                                  color: Colors.white,
                                                  fontSize: 12)),
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

                  SizedBox(
                    height: 15,
                  ),

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
                                padding: const EdgeInsets.only(
                                    top: 18.0, left: 18, bottom: 8),
                                child: Text(
                                  'Event Organised',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon:Icon(Icons.local_activity,
                                                color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('Workshop',
                                              style: GoogleFonts.kufam(
                                                  color: Colors.white,
                                                  fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.school,
                                                color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('Conference',
                                              style: GoogleFonts.kufam(
                                                  color: Colors.white,
                                                  fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon:Icon(Icons.event_note,
                                                color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('Seminar',
                                              style: GoogleFonts.kufam(
                                                  color: Colors.white,
                                                  fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon:  Icon(Icons.emoji_events,
                                                color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('FDP',
                                              style: GoogleFonts.kufam(
                                                  color: Colors.white,
                                                  fontSize: 12)),
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

                  SizedBox(
                    height: 15,
                  ),

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
                                padding: const EdgeInsets.only(
                                    top: 18.0, left: 18, bottom: 8),
                                child: Text(
                                  'Course Completed',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.checklist_rtl_rounded,
                                                color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the first icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('Courses',
                                              style: GoogleFonts.kufam(
                                                  color: Colors.white,
                                                  fontSize: 12)),
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

                  SizedBox(
                    height: 15,
                  ),

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
                                padding: const EdgeInsets.only(
                                    top: 18.0, left: 18, bottom: 8),
                                child: Text(
                                  'Publication',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.article,
                                                color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the first icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('Research Papers',
                                              style: GoogleFonts.kufam(
                                                  color: Colors.white,
                                                  fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          color: Color(0x1A0CECDA),
                                          child: IconButton(
                                            icon: Icon(Icons.book,
                                                color: Colors.white),
                                            onPressed: () {
                                              // Add functionality for the first icon button
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text('Books',
                                              style: GoogleFonts.kufam(
                                                  color: Colors.white,
                                                  fontSize: 12)),
                                        ),
                                      ],
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
                  //               padding: const EdgeInsets.only(top: 18.0,left: 18,bottom: 8),
                  //               child: Text(
                  //                 'Event Attended',
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
                  //                             // Add functionality for the icon button
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Workshop', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
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
                  //                             // Add functionality for the icon button
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Conference', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
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
                  //                             // Add functionality for the icon button
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
                  //                           icon: Icon(Icons.emoji_events, color: Colors.white),
                  //                           onPressed: () {
                  //                             // Add functionality for the icon button
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('FDP', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //
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
                  //                 'Event Organised',
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
                  //                           icon: Icon(Icons.computer, color: Colors.white),
                  //                           onPressed: () {
                  //                             // Add functionality for the icon button
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Workshop', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.sports_soccer, color: Colors.white),
                  //                           onPressed: () {
                  //                             // Add functionality for the icon button
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Conference', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                         color: Color(0x1A0CECDA),
                  //                         child: IconButton(
                  //                           icon: Icon(Icons.music_note, color: Colors.white),
                  //                           onPressed: () {
                  //                             // Add functionality for the icon button
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
                  //                           icon: Icon(Icons.music_video, color: Colors.white),
                  //                           onPressed: () {
                  //                             // Add functionality for the icon button
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('FDP', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
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
                  //                 'Course Completed',
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
                  //                             // Add functionality for the first icon button
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(top:4.0),
                  //                         child: Text('Courses', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //
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
                  //                 'Publication',
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
                  //                         child: Text('Research Papers', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
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
                  //                         child: Text('Books', style: GoogleFonts.kufam(color: Colors.white,fontSize: 12)),
                  //                       ),
                  //                     ],
                  //                   ),

                                  ],
                                ),
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
          ),
        ],
      ),
    );
  }
}
