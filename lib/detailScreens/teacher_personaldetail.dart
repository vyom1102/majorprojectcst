// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class Teacher {
//   final String id;
//   final String fullName;
//   final String mobileNumber;
//   final String motherName;
//   final String motherOccupation;
//   final String motherOfficeAddress;
//   final String motherPhoneNumber;
//   final String permanentAddress;
//   final String rollNumber;
//   final String year;
//   final String jeeRank;
//   final String dateOfBirth;
//   final String emailAddress;
//   final String fatherName;
//   final String fatherOccupation;
//   final String fatherOfficeAddress;
//   final String fatherPhoneNumber;
//   final String image;
//
//   Teacher({
//     required this.id,
//     required this.fullName,
//     required this.mobileNumber,
//     required this.motherName,
//     required this.motherOccupation,
//     required this.motherOfficeAddress,
//     required this.motherPhoneNumber,
//     required this.permanentAddress,
//     required this.rollNumber,
//     required this.year,
//     required this.jeeRank,
//     required this.dateOfBirth,
//     required this.emailAddress,
//     required this.fatherName,
//     required this.fatherOccupation,
//     required this.fatherOfficeAddress,
//     required this.fatherPhoneNumber,
//     required this.image,
//   });
// }
//
// class TeacherList extends StatefulWidget {
//   @override
//   _teacherListState createState() => _teacherListState();
// }
//
// class _teacherListState extends State<TeacherList> {
//   final databaseReference = FirebaseDatabase.instance.ref();
//   late DatabaseReference _membersRef;
//
//   List<Teacher> teachers = [];
//   List<Teacher> filteredteachers = [];
//
//   TextEditingController _searchController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _membersRef = FirebaseDatabase.instance.ref().child('teachers/id');
//     fetchteachers();
//   }
//
//   Future<void> fetchteachers() async {
//     _membersRef.onValue.listen((event) {
//       final data = event.snapshot.value as Map<dynamic, dynamic>?;
//       if (data != null) {
//         final List<Teacher> fetchedteachers = [];
//         data.forEach((key, value) {
//           fetchedteachers.add(Teacher(
//             id: key.toString(),
//             fullName: value['fullName'] ?? '',
//             mobileNumber: value['mobileNumber'] ?? '',
//             motherName: value['motherName'] ?? '',
//             motherOccupation: value['motherOccupation'] ?? '',
//             motherOfficeAddress: value['motherOfficeAddress'] ?? '',
//             motherPhoneNumber: value['motherPhoneNumber'] ?? '',
//             permanentAddress: value['permanentAddress'] ?? '',
//             rollNumber: value['rollNumber'] ?? '',
//             year: value['year'] ?? '',
//             jeeRank: value['jeeRank'] ?? '',
//             dateOfBirth: value['dateOfBirth'] ?? '',
//             emailAddress: value['emailAddress'] ?? '',
//             fatherName: value['fatherName'] ?? '',
//             fatherOccupation: value['fatherOccupation'] ?? '',
//             fatherOfficeAddress: value['fatherOfficeAddress'] ?? '',
//             fatherPhoneNumber: value['fatherPhoneNumber'] ?? '',
//             image: value['image'] ?? '',
//           ));
//         });
//         setState(() {
//           teachers = fetchedteachers;
//           filteredteachers = fetchedteachers;
//         });
//       }
//     });
//   }
//
//   void _filterteachers(String query) {
//     setState(() {
//       if (query.isNotEmpty) {
//         filteredteachers = teachers.where((teacher) =>
//         teacher.fullName.toLowerCase().contains(query.toLowerCase()) ||
//             teacher.id.toLowerCase().contains(query.toLowerCase())).toList();
//       } else {
//         filteredteachers = teachers;
//       }
//     });
//   }
//
//   void _showDetailsDialog(Teacher teacher) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('teacher Details'),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('ID: ${teacher.id}'),
//               Text('Full Name: ${teacher.fullName}'),
//               Text('Mobile Number: ${teacher.mobileNumber}'),
//               Text('Mother Name: ${teacher.motherName}'),
//               Text('Mother Occupation: ${teacher.motherOccupation}'),
//               Text('Mother Office Address: ${teacher.motherOfficeAddress}'),
//               Text('Mother Phone Number: ${teacher.motherPhoneNumber}'),
//               Text('Permanent Address: ${teacher.permanentAddress}'),
//               Text('Roll Number: ${teacher.rollNumber}'),
//               Text('Year: ${teacher.year}'),
//               Text('JEE Rank: ${teacher.jeeRank}'),
//               Text('Date of Birth: ${teacher.dateOfBirth}'),
//               Text('Email Address: ${teacher.emailAddress}'),
//               Text('Father Name: ${teacher.fatherName}'),
//               Text('Father Occupation: ${teacher.fatherOccupation}'),
//               Text('Father Office Address: ${teacher.fatherOfficeAddress}'),
//               Text('Father Phone Number: ${teacher.fatherPhoneNumber}'),
//               Text('Image: ${teacher.image}'),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff141318),
//
//       body: Stack(
//           children: [
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Image.asset(
//                 'images/bottom_container.png',
//                 fit: BoxFit.cover,
//                 height: 200,
//                 width: MediaQuery.sizeOf(context)
//                     .width, // Adjust the height as needed
//               ),
//             ),
//             Column(
//               children: [
//                 SizedBox(height: MediaQuery.sizeOf(context).height*0.1,),
//                 Row(
//                   children: [
//                     SizedBox(width: 10,),
//                     Text(
//                       'teacher\'s Details',
//                       style: GoogleFonts.kufam(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 26,
//                           color: Color(0xff0CECDA)),
//                     ),
//                   ],
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: TextField(
//                     controller: _searchController,
//                     decoration: InputDecoration(
//                       labelText: 'Search by Name or ID',
//                       prefixIcon: Icon(Icons.search),
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                     ),
//                     onChanged: _filterteachers,
//                   ),
//                 ),
//
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: filteredteachers.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         height: 100,
//                         child: Card(
//
//                           child: ListTile(
//                             leading: CircleAvatar( // Display photo on the left side
//                               radius: 40,
//                               backgroundImage: AssetImage('path_to_image'), // Provide the path to the image
//                             ),
//                             title:Padding(
//                               padding: const EdgeInsets.only(top: 10.0),
//                               child: Text('${filteredteachers[index].fullName.toUpperCase()}'),
//                             ),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('ID: ${filteredteachers[index].rollNumber}'),
//
//                                 Text('Contact Number: ${filteredteachers[index].mobileNumber}'),
//                                 Text('Email: ${filteredteachers[index].emailAddress}'),
//                               ],
//                             ),
//                             onTap: () {
//                               _showDetailsDialog(filteredteachers[index]);
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ]
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher {
  final String id;
  final String fullName;
  final String mobileNumber;
  final String permanentAddress;
  final String joiningDate;
  final String currentDesignation;
  final String dateOfBirth;
  final String department;
  final String emailAddress;
  final String employeeId;
  final String fatherHusbandName;
  final String highestQualification;

  Teacher({
    required this.id,
    required this.fullName,
    required this.mobileNumber,
    required this.permanentAddress,
    required this.joiningDate,
    required this.currentDesignation,
    required this.dateOfBirth,
    required this.department,
    required this.emailAddress,
    required this.employeeId,
    required this.fatherHusbandName,
    required this.highestQualification,
  });
}

class TeacherList extends StatefulWidget {
  @override
  _TeacherListState createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
  final databaseReference = FirebaseDatabase.instance.ref();
  late DatabaseReference _membersRef;

  List<Teacher> teachers = [];
  List<Teacher> filteredteachers = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _membersRef = FirebaseDatabase.instance.ref().child('teachers/id');
    fetchTeachers();
  }

  Future<void> fetchTeachers() async {
    _membersRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        final List<Teacher> fetchedTeachers = [];
        data.forEach((key, value) {
          fetchedTeachers.add(Teacher(
            id: key.toString(),
            fullName: value['fullName'] ?? '',
            mobileNumber: value['mobileNumber'] ?? '',
            permanentAddress: value['permanentAddress'] ?? '',
            joiningDate: value['joiningDate'] ?? '',
            currentDesignation: value['currentDesignation'] ?? '',
            dateOfBirth: value['dateOfBirth'] ?? '',
            department: value['department'] ?? '',
            emailAddress: value['emailAddress'] ?? '',
            employeeId: value['employeeId'] ?? '',
            fatherHusbandName: value['fatherHusbandName'] ?? '',
            highestQualification: value['highestQualification'] ?? '',
          ));
        });
        setState(() {
          teachers = fetchedTeachers;
          filteredteachers = fetchedTeachers;
        });
      }
    });
  }

  void _filterTeachers(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredteachers = teachers.where((teacher) =>
        teacher.fullName.toLowerCase().contains(query.toLowerCase()) ||
            teacher.id.toLowerCase().contains(query.toLowerCase())).toList();
      } else {
        filteredteachers = teachers;
      }
    });
  }

  void _showDetailsDialog(Teacher teacher) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Teacher Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('ID: ${teacher.id}'),
              Text('Full Name: ${teacher.fullName}'),
              Text('Mobile Number: ${teacher.mobileNumber}'),
              Text('Permanent Address: ${teacher.permanentAddress}'),
              Text('Joining Date: ${teacher.joiningDate}'),
              Text('Current Designation: ${teacher.currentDesignation}'),
              Text('Date of Birth: ${teacher.dateOfBirth}'),
              Text('Department: ${teacher.department}'),
              Text('Email Address: ${teacher.emailAddress}'),
              Text('Employee ID: ${teacher.employeeId}'),
              Text('Father/Husband Name: ${teacher.fatherHusbandName}'),
              Text('Highest Qualification: ${teacher.highestQualification}'),
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
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Text(
                    'Teacher\'s Details',
                    style: GoogleFonts.kufam(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      color: Color(0xff0CECDA),
                    ),
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
                  onChanged: _filterTeachers,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredteachers.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('path_to_image'),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('${filteredteachers[index].fullName.toUpperCase()}'),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID: ${filteredteachers[index].id}'),
                              Text('Mobile Number: ${filteredteachers[index].mobileNumber}'),
                              // Text('Joining Date: ${filteredteachers[index].joiningDate}'),
                            ],
                          ),
                          onTap: () {
                            _showDetailsDialog(filteredteachers[index]);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
