import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentIntra {
  final String id;

  final String enrollmentNumber;
  final String eventName;
  final String eventDetail;
  final String startingDate;
  final String endingDate;
  final String duration;
  final String group;
  final String achievement;
  final String address;


  StudentIntra({
    required this.id,
    required this.enrollmentNumber,
    required this.eventName,
    required this.eventDetail,
    required this.startingDate,
    required this.endingDate,
    required this.duration,
    required this.group,
    required this.achievement,
    required this.address,
  });
}


class StudentIntraList extends StatefulWidget {
  @override
  _StudentIntraListState createState() => _StudentIntraListState();
}

class _StudentIntraListState extends State<StudentIntraList> {
  final databaseReference = FirebaseDatabase.instance.ref();
  late DatabaseReference _membersRef;

  List<StudentIntra> students = [];
  List<StudentIntra> filteredStudents = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _membersRef = FirebaseDatabase.instance.ref().child('StudentData/Sports/studentintracollegesport/id');
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    try {
      _membersRef.onValue.listen((event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          final List<StudentIntra> fetchedStudents = [];
          data.forEach((key, value) {
            fetchedStudents.add(StudentIntra(
              id: key.toString(),
              enrollmentNumber: value['enrollnumb'] ?? '',
              eventName: value['eventname'] ?? '',
              eventDetail: value['detailname'] ?? '',
              startingDate: value['Startingdate'] ?? '',
              endingDate: value['Endingdate'] ?? '',
              duration: value['duration'] ?? '',
              group: value['individual'] ?? '',
              achievement: value['achievement'] ?? '',
              address: value['address'] ?? '',
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
// final String enrollmentNumber;
  // final String eventName;
  // final String eventDetail;
  // final String startingDate;
  // final String endingDate;
  // final String duration;
  // final String group;
  // final String achievement;
  // final String address;
  void _showDetailsDialog(StudentIntra student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Student Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
            //  Text('ID: ${student.id}'),
              Text('Enrollment Number: ${student.enrollmentNumber}'),
              Text('Event Name: ${student.eventName}'),
              Text('Event Detail: ${student.eventDetail}'),
              Text('Starting Date: ${student.startingDate}'),
              Text('Ending Date: ${student.endingDate}'),
              Text('Duration: ${student.duration}'),
              Text('Group: ${student.group}'),
              Text('Achievement: ${student.achievement}'),
              Text('Address: ${student.address}'),
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
                      'IntraCollege Sports Details',
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
