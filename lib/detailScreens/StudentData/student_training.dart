import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentTraining {
  final String id;

  final String enrollmentNumber;
  final String training;
  final String durationOfIntern;
  final String startingDate;
  final String endingDate;
  final String platformUse;
  final String research;
  final String guide;
  final String designation;
  final String nameOfCompany;
  final String companyAddress;
  final String sector;
  final String scale;
  final String incorporation;
  final String productService;
  final String mode;
  final String website;
  final String stipend;

  StudentTraining({
    required this.id,
    required this.enrollmentNumber,
    required this.training,
    required this.durationOfIntern,
    required this.startingDate,
    required this.endingDate,
    required this.platformUse,
    required this.research,
    required this.guide,
    required this.designation,
    required this.nameOfCompany,
    required this.companyAddress,
    required this.sector,
    required this.scale,
    required this.incorporation,
    required this.productService,
    required this.mode,
    required this.website,
    required this.stipend,
  });
}


class StudentTrainingList extends StatefulWidget {
  @override
  _StudentTrainingListState createState() => _StudentTrainingListState();
}

class _StudentTrainingListState extends State<StudentTrainingList> {
  final databaseReference = FirebaseDatabase.instance.ref();
  late DatabaseReference _membersRef;

  List<StudentTraining> students = [];
  List<StudentTraining> filteredStudents = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _membersRef = FirebaseDatabase.instance.ref().child('studenttraining/id');
    fetchStudents();
  }

  // Future<void> fetchStudents() async {
  //   _membersRef.onValue.listen((event) {
  //     final data = event.snapshot.value as Map<dynamic, dynamic>?;
  //     if (data != null) {
  //       final List<StudentTraining> fetchedStudents = [];
  //       data.forEach((key, value) {
  //         fetchedStudents.add(StudentTraining(
  //           id: key.toString(),
  //           fullName: value['fullName'] ?? '',
  //           mobileNumber: value['mobileNumber'] ?? '',
  //           motherName: value['motherName'] ?? '',
  //
  //         ));
  //       });
  //       setState(() {
  //         students = fetchedStudents;
  //         filteredStudents = fetchedStudents;
  //       });
  //     }
  //   });
  // }
  Future<void> fetchStudents() async {
    try {
      _membersRef.onValue.listen((event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          final List<StudentTraining> fetchedStudents = [];
          data.forEach((key, value) {
            fetchedStudents.add(StudentTraining(
              id: key.toString(),
              enrollmentNumber: value['enrollmentNumber'] ?? '',
              training: value['training'] ?? '',
              durationOfIntern: value['durationOfIntern'] ?? '',
              startingDate: value['startingDate'] ?? '',
              endingDate: value['endingDate'] ?? '',
              platformUse: value['platformUse'] ?? '',
              research: value['research'] ?? '',
              guide: value['guide'] ?? '',
              designation: value['designation'] ?? '',
              nameOfCompany: value['nameOfCompany'] ?? '',
              companyAddress: value['companyAddress'] ?? '',
              sector: value['sector'] ?? '',
              scale: value['scale'] ?? '',
              incorporation: value['incorporation'] ?? '',
              productService: value['productService'] ?? '',
              mode: value['mode'] ?? '',
              website: value['website'] ?? '',
              stipend: value['stipend'] ?? '',
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

  // void _showDetailsDialog(StudentTraining student) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Student Details'),
  //         content: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text('ID: ${student.id}'),
  //             Text('Full Name: ${student.fullName}'),
  //             Text('Mobile Number: ${student.mobileNumber}'),
  //             Text('Mother Name: ${student.motherName}'),
  //             Text('Mother Occupation: ${student.motherOccupation}'),
  //             Text('Mother Office Address: ${student.motherOfficeAddress}'),
  //             Text('Mother Phone Number: ${student.motherPhoneNumber}'),
  //             Text('Permanent Address: ${student.permanentAddress}'),
  //             Text('Roll Number: ${student.rollNumber}'),
  //             Text('Year: ${student.year}'),
  //             Text('JEE Rank: ${student.jeeRank}'),
  //             Text('Date of Birth: ${student.dateOfBirth}'),
  //             Text('Email Address: ${student.emailAddress}'),
  //             Text('Father Name: ${student.fatherName}'),
  //             Text('Father Occupation: ${student.fatherOccupation}'),
  //             Text('Father Office Address: ${student.fatherOfficeAddress}'),
  //             Text('Father Phone Number: ${student.fatherPhoneNumber}'),
  //             Text('Image: ${student.image}'),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text('Close'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  void _showDetailsDialog(StudentTraining student) {
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
              Text('Training: ${student.training}'),
              Text('Duration of Internship: ${student.durationOfIntern}'),
              Text('Starting Date: ${student.startingDate}'),
              Text('Ending Date: ${student.endingDate}'),
              Text('Platform Use: ${student.platformUse}'),
              Text('Research: ${student.research}'),
              Text('Guide: ${student.guide}'),
              Text('Designation: ${student.designation}'),
              Text('Name of Company: ${student.nameOfCompany}'),
              Text('Company Address: ${student.companyAddress}'),
              Text('Sector: ${student.sector}'),
              Text('Scale: ${student.scale}'),
              Text('Incorporation: ${student.incorporation}'),
              Text('Product/Service: ${student.productService}'),
              Text('Mode: ${student.mode}'),
              Text('Website: ${student.website}'),
              Text('Stipend: ${student.stipend}'),
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
                      'Student\'s Training Details',
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
