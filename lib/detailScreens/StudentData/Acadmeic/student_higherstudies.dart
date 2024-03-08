import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentHigherStudies {
  final String id;

  final String enrollmentNumber;
  final String courseName;
  final String university;
  final String location;
  final String endingDate;
  final String startingDate;
  final String duration;
  final String ppo;
  final String detailPPO;


  StudentHigherStudies({
    required this.id,
    required this.enrollmentNumber,
    required this.courseName,
    required this.university,
    required this.startingDate,
    required this.endingDate,
    required this.location,
    required this.duration,
    required this.ppo,
    required this.detailPPO,
  });
}


class StudentStudiesList extends StatefulWidget {
  @override
  _StudentStudiesListState createState() => _StudentStudiesListState();
}

class _StudentStudiesListState extends State<StudentStudiesList> {
  final databaseReference = FirebaseDatabase.instance.ref();
  late DatabaseReference _membersRef;

  List<StudentHigherStudies> students = [];
  List<StudentHigherStudies> filteredStudents = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _membersRef = FirebaseDatabase.instance.ref().child('StudentData/Academic/studentHigherStudies/id');
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    try {
      _membersRef.onValue.listen((event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          final List<StudentHigherStudies> fetchedStudents = [];
          data.forEach((key, value) {
            fetchedStudents.add(StudentHigherStudies(
              id: key.toString(),
              enrollmentNumber: value['enrollmentNumber'] ?? '',
              courseName: value['nameOfCourse'] ?? '',
              university: value['university'] ?? '',
              startingDate: value['StartingDate'] ?? '',
              endingDate: value['EndingDate'] ?? '',
              location: value['location'] ?? '',
              duration: value['duration'] ?? '',
              ppo: value['ppoInfo'] ?? '',
              detailPPO: value['ppoDetail'] ?? '',
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

  void _showDetailsDialog(StudentHigherStudies student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Student Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //Text('ID: ${student.id}'),
              Text('Enrollment Number: ${student.enrollmentNumber}'),
              Text('Course Name: ${student.courseName}'),
              Text('University: ${student.university}'),
              Text('Starting Date: ${student.startingDate}'),
              Text('Ending Date: ${student.endingDate}'),
              Text('Location: ${student.location}'),
              Text('Duration: ${student.duration}'),
              Text('PPO: ${student.ppo}'),
              Text('Detail of PPO: ${student.detailPPO}'),
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
                      'Higher Studies Details',
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
                      labelText: 'Search by Enrollment Number',
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,

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
