
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
                    labelText: 'Search by Name or Id',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  onChanged: _filterTeachers,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredteachers.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('images/teacherIcon.png'),
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
