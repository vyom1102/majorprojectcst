import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Student {
  final String id;
  final String fullName;
  final String mobileNumber;
  final String motherName;
  final String motherOccupation;
  final String motherOfficeAddress;
  final String motherPhoneNumber;
  final String permanentAddress;
  final String rollNumber;
  final String year;
  final String jeeRank;
  final String dateOfBirth;
  final String emailAddress;
  final String fatherName;
  final String fatherOccupation;
  final String fatherOfficeAddress;
  final String fatherPhoneNumber;
  final String image;

  Student({
    required this.id,
    required this.fullName,
    required this.mobileNumber,
    required this.motherName,
    required this.motherOccupation,
    required this.motherOfficeAddress,
    required this.motherPhoneNumber,
    required this.permanentAddress,
    required this.rollNumber,
    required this.year,
    required this.jeeRank,
    required this.dateOfBirth,
    required this.emailAddress,
    required this.fatherName,
    required this.fatherOccupation,
    required this.fatherOfficeAddress,
    required this.fatherPhoneNumber,
    required this.image,
  });
}

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final databaseReference = FirebaseDatabase.instance.ref();
  late DatabaseReference _membersRef;
  // late DatabaseReference _membersRefer;

  List<Student> students = [];
  List<Student> filteredStudents = [];
  // List<Student> filterimage =[];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _membersRef = FirebaseDatabase.instance.ref().child('student/id');
    // _membersRefer = FirebaseDatabase.instance.ref().child('studentphoto');

    fetchStudents();
  }

  Future<void> fetchStudents() async {
    _membersRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        final List<Student> fetchedStudents = [];
        data.forEach((key, value) {
          fetchedStudents.add(Student(
            id: key.toString(),
            fullName: value['fullName'] ?? '',
            mobileNumber: value['mobileNumber'] ?? '',
            motherName: value['motherName'] ?? '',
            motherOccupation: value['motherOccupation'] ?? '',
            motherOfficeAddress: value['motherOfficeAddress'] ?? '',
            motherPhoneNumber: value['motherPhoneNumber'] ?? '',
            permanentAddress: value['permanentAddress'] ?? '',
            rollNumber: value['rollNumber'] ?? '',
            year: value['year'] ?? '',
            jeeRank: value['jeeRank'] ?? '',
            dateOfBirth: value['dateOfBirth'] ?? '',
            emailAddress: value['emailAddress'] ?? '',
            fatherName: value['fatherName'] ?? '',
            fatherOccupation: value['fatherOccupation'] ?? '',
            fatherOfficeAddress: value['fatherOfficeAddress'] ?? '',
            fatherPhoneNumber: value['fatherPhoneNumber'] ?? '',
            image: value['image'] ?? '',
          ));
        });
        setState(() {
          students = fetchedStudents;
          filteredStudents = fetchedStudents;
        });
      }
    });
  }

  void _filterStudents(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredStudents = students.where((student) =>
        student.fullName.toLowerCase().contains(query.toLowerCase()) ||
            student.id.toLowerCase().contains(query.toLowerCase())).toList();
      } else {
        filteredStudents = students;
      }
    });
  }

  void _showDetailsDialog(Student student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Student Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text('ID: ${student.id}'),
              Text('Full Name: ${student.fullName}'),
              Text('Mobile Number: ${student.mobileNumber}'),
              Text('Mother Name: ${student.motherName}'),
              Text('Mother Occupation: ${student.motherOccupation}'),
              Text('Mother Office Address: ${student.motherOfficeAddress}'),
              Text('Mother Phone Number: ${student.motherPhoneNumber}'),
              Text('Permanent Address: ${student.permanentAddress}'),
              Text('Roll Number: ${student.rollNumber}'),
              Text('Year: ${student.year}'),
              Text('JEE Rank: ${student.jeeRank}'),
              Text('Date of Birth: ${student.dateOfBirth}'),
              Text('Email Address: ${student.emailAddress}'),
              Text('Father Name: ${student.fatherName}'),
              Text('Father Occupation: ${student.fatherOccupation}'),
              Text('Father Office Address: ${student.fatherOfficeAddress}'),
              Text('Father Phone Number: ${student.fatherPhoneNumber}'),
              // Text('Image: ${student.image}'),
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
              height: MediaQuery.sizeOf(context).height*0.285,
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
                  'Student\'s Details',
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
                  labelText: 'Search by Enrollment No or Name',
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

            // Expanded(
            //   child: ListView.builder(
            //     itemCount: filteredStudents.length,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         height: MediaQuery.sizeOf(context).height*0.135,
            //         child: Card(
            //
            //           child: ListTile(
            //             leading: CircleAvatar(
            //               radius: 40,
            //               backgroundImage: NetworkImage(
            //                 // filteredStudents[index].image,
            //                 // _membersRefer.child(filteredStudents[index].rollNumber) as String
            //
            //                   "https://firebasestorage.googleapis.com/v0/b/insightacademia-747dc.appspot.com/o/images%2F68606038386?alt=media&token=68a834a5-8c04-4d64-ae7b-f7967f828705"
            //
            //
            //               ),
            //             ),
            //             title:Padding(
            //               padding: const EdgeInsets.only(top: 10.0),
            //               child: Text('${filteredStudents[index].fullName.toUpperCase()}'),
            //             ),
            //             subtitle: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text('Enrollment No: ${filteredStudents[index].rollNumber}'),
            //
            //                 Text('Contact Number: ${filteredStudents[index].mobileNumber}'),
            //                 Text('Email: ${filteredStudents[index].emailAddress}'),
            //               ],
            //             ),
            //             onTap: () {
            //               _showDetailsDialog(filteredStudents[index]);
            //             },
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: filteredStudents.length,
            //     itemBuilder: (context, index) {
            //       return Card(
            //         child: ListTile(
            //           leading: CircleAvatar(
            //             radius: 30,
            //             backgroundImage: NetworkImage(
            //                 "https://firebasestorage.googleapis.com/v0/b/insightacademia-747dc.appspot.com/o/images%2F68606038386?alt=media&token=68a834a5-8c04-4d64-ae7b-f7967f828705"
            //             ),
            //           ),
            //           title: Padding(
            //             padding: const EdgeInsets.only(top: 10.0),
            //             child: Text(
            //               '${filteredStudents[index].fullName.toUpperCase()}',
            //               style: TextStyle(fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //           subtitle: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('Enrollment No: ${filteredStudents[index].rollNumber}'),
            //               Text('Contact Number: ${filteredStudents[index].mobileNumber}'),
            //               Text('Email: ${filteredStudents[index].emailAddress}'),
            //             ],
            //           ),
            //           onTap: () {
            //             _showDetailsDialog(filteredStudents[index]);
            //           },
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredStudents.length,
                itemBuilder: (context, index) {
                  String imageUrl;
                  if (filteredStudents[index].rollNumber.isNotEmpty) {
                    imageUrl = "https://firebasestorage.googleapis.com/v0/b/insightacademia-747dc.appspot.com/o/images%2F${filteredStudents[index].rollNumber}?alt=media";
                  } else {
                    imageUrl = "https://firebasestorage.googleapis.com/v0/b/insightacademia-747dc.appspot.com/o/images%2F68606038386?alt=media&token=68a834a5-8c04-4d64-ae7b-f7967f828705";
                  }

                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          '${filteredStudents[index].fullName.toUpperCase()}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Enrollment No: ${filteredStudents[index].rollNumber}'),
                          Text('Contact Number: ${filteredStudents[index].mobileNumber}'),
                          Text('Email: ${filteredStudents[index].emailAddress}'),
                        ],
                      ),
                      onTap: () {
                        _showDetailsDialog(filteredStudents[index]);
                      },
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
