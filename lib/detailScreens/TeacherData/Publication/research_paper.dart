import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentCourse {
  final String id;

  final String name;
  final String isbn;
  final String journalName;
  final String month;
  final String tileOfPaper;
  final String year;

  StudentCourse({
    required this.id,
    required this.name,
    required this.isbn,
    required this.journalName,
    required this.month,
    required this.tileOfPaper,
    required this.year,
  });
}


class TeacherPaperList extends StatefulWidget {
  @override
  _TeacherPaperListState createState() => _TeacherPaperListState();
}

class _TeacherPaperListState extends State<TeacherPaperList> {
  final databaseReference = FirebaseDatabase.instance.ref();
  late DatabaseReference _membersRef;

  List<StudentCourse> students = [];
  List<StudentCourse> filteredStudents = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _membersRef = FirebaseDatabase.instance.ref().child('TeacherData/TeachersCourseCompleted/id');
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
              name: value['name'] ?? '',
              isbn: value['isbn'] ?? '',
              journalName: value['journalName'] ?? '',
              month: value['month'] ?? '',
              tileOfPaper: value['tileOfPaper'] ?? '',
              year: value['year'] ?? '',
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
      print('Error fetching detail: $error');
    }
  }

  void _filterStudents(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredStudents = students.where((student) =>
        student.id.toLowerCase().contains(query.toLowerCase()) ||
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
          title: Text('Paper Publication Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('ID: ${student.id}'),
              Text('Name: ${student.name}'),
              Text('ISBN: ${student.isbn}'),
              Text('Journal Name: ${student.journalName}'),
              Text('Month: ${student.month}'),
              Text('Tile Of Paper: ${student.tileOfPaper}'),
              Text('Year: ${student.year}'),
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
                      'Course Completed Details',
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
                              child: Text('${filteredStudents[index].id.toUpperCase()}',style: TextStyle(color:Colors.white),),
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