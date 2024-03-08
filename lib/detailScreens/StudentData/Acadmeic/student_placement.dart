import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentPlacement {
  final String id;

  final String enrollmentNumber;
  final String batch;
  final String placement;
  final String campusPlacement;
  final String companyName;
  final String package;
  final String postion;
  final String location;
  //final String null;


  StudentPlacement({
    required this.id,
    required this.enrollmentNumber,
    required this.batch,
    required this.placement,
    required this.campusPlacement,
    required this.companyName,
    required this.package,
    required this.postion,
    required this.location,
  });
}


class StudentPlacementList extends StatefulWidget {
  @override
  _StudentPlacementListState createState() => _StudentPlacementListState();
}

class _StudentPlacementListState extends State<StudentPlacementList> {
  final databaseReference = FirebaseDatabase.instance.ref();
  late DatabaseReference _membersRef;

  List<StudentPlacement> students = [];
  List<StudentPlacement> filteredStudents = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _membersRef = FirebaseDatabase.instance.ref().child('StudentData/Academic/studentPlacement/id');
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    try {
      _membersRef.onValue.listen((event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          final List<StudentPlacement> fetchedStudents = [];
          data.forEach((key, value) {
            fetchedStudents.add(StudentPlacement(
              id: key.toString(),
              enrollmentNumber: value['enrollmentNumber'] ?? '',
              batch: value['batch'] ?? '',
              placement: value['placement'] ?? '',
              campusPlacement: value['campusPlacement'] ?? '',
              companyName: value['companyName'] ?? '',
              package: value['package'] ?? '',
              postion: value['position'] ?? '',
              location: value['location'] ?? '',
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
  void _showDetailsDialog(StudentPlacement student) {
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
              Text('Batch: ${student.batch}'),
              Text('Campus Placement: ${student.campusPlacement}'),
              Text('Company Name: ${student.companyName}'),
              Text('Package: ${student.package}'),
              Text('postion: ${student.postion}'),
              Text('Location: ${student.location}'),
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
                      'Student\'s Placement Details',
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
