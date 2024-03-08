import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentCourse {
  final String id;

  final String enrollmentNumber;
  final String courseName;
  final String instructorName;
  final String specialization;
  final String duration;
  final String onlineOffline;
  final String certificate;
  final String courseLearning;
  //final String null;


  StudentCourse({
    required this.id,
    required this.enrollmentNumber,
    required this.courseName,
    required this.instructorName,
    required this.specialization,
    required this.duration,
    required this.onlineOffline,
    required this.certificate,
    required this.courseLearning,
  });
}


class StudentCourseList extends StatefulWidget {
  @override
  _StudentCourseListState createState() => _StudentCourseListState();
}

class _StudentCourseListState extends State<StudentCourseList> {
  final databaseReference = FirebaseDatabase.instance.ref();
  late DatabaseReference _membersRef;

  List<StudentCourse> students = [];
  List<StudentCourse> filteredStudents = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _membersRef = FirebaseDatabase.instance.ref().child('StudentData/Academic/studentCourse/id');
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    try {
      _membersRef.onValue.listen((event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          final List<StudentCourse> fetchedStudents = [];
          data.forEach((key, value) {
            fetchedStudents.add(StudentCourse(
              id: key.toString(),
              enrollmentNumber: value['enrollmentNumber'] ?? '',
              courseName: value['courseName'] ?? '',
              instructorName: value['instructorName'] ?? '',
              specialization: value['specialization'] ?? '',
              duration: value['duration'] ?? '',
              onlineOffline: value['onlineoffline'] ?? '',
              certificate: value['certificate'] ?? '',
              courseLearning: value['courseLearning'] ?? '',
            ));
          });
          setState(() {
            students = fetchedStudents;
            filteredStudents = fetchedStudents;
          });
        }
      });
    } catch (error) {
      // Handle the error
      print('Error fetching students: $error');
    }
  }

  void _filterStudents(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredStudents = students.where((student) =>
        student.enrollmentNumber.toLowerCase().contains(query.toLowerCase()) ||
            student.id.toLowerCase().contains(query.toLowerCase())).toList();
      } else {
        filteredStudents = students;
      }
    });
  }

  void _showDetailsDialog(StudentCourse student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Student Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('ID: ${student.id}'),
              Text('Enrollment Number: ${student.enrollmentNumber}'),
              Text('Course Name: ${student.courseName}'),
              Text('Instructor Name: ${student.instructorName}'),
              Text('Specialization: ${student.specialization}'),
              Text('Duration: ${student.duration}'),
              Text('Online Offline: ${student.onlineOffline}'),
              Text('Certificate: ${student.certificate}'),
              Text('Course Learning: ${student.courseLearning}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141318),

      body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'images/bottom_container.png',
                fit: BoxFit.cover,
                height: 200,
                width: MediaQuery.sizeOf(context)
                    .width, // Adjust the height as needed
              ),
            ),
            Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height*0.1,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text(
                      'Student\'s Course Details',
                      style: GoogleFonts.kufam(
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                          color: Color(0xff0CECDA)),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search by Name or ID',
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onChanged: _filterStudents,
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: filteredStudents.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 60,
                        child: Card(
                          color: Color(0xff2D2B33),
                          child: ListTile(


                            title:Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: Text('${filteredStudents[index].enrollmentNumber.toUpperCase()}',style: TextStyle(color:Colors.white),),
                            ),

                            onTap: () {
                              _showDetailsDialog(filteredStudents[index]);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}
