import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentStartup {
  final String id;

  final String enrollmentNumber;
  final String companyName;
  final String companyProfile;
  final String designation;
  final String startingDate;
  final String location;


  StudentStartup({
    required this.id,
    required this.enrollmentNumber,
    required this.companyName,
    required this.companyProfile,
    required this.startingDate,
    required this.designation,
    required this.location,
  });
}


class StudentStartupList extends StatefulWidget {
  @override
  _StudentStartupListState createState() => _StudentStartupListState();
}

class _StudentStartupListState extends State<StudentStartupList> {
  final databaseReference = FirebaseDatabase.instance.ref();
  late DatabaseReference _membersRef;

  List<StudentStartup> students = [];
  List<StudentStartup> filteredStudents = [];

  TextEditingController _searchController = TextEditingController();
  String _selectedYear = '2024'; // Default selected year

  @override
  void initState() {
    super.initState();
    _membersRef = FirebaseDatabase.instance.ref().child('StudentData/Academic/studentStartup/id');
    fetchStudents();
  }
  Future<void> fetchStudents() async {
    try {
      _membersRef.onValue.listen((event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          final List<StudentStartup> fetchedStudents = [];
          data.forEach((key, value) {
            fetchedStudents.add(StudentStartup(
              id: key.toString(),
              enrollmentNumber: value['enrollmentNumber'] ?? '',
              companyName: value['companyName'] ?? '',
              companyProfile: value['companyProfile'] ?? '',
              startingDate: value['StartingDate'] ?? '',
              designation: value['designation'] ?? '',
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
  // enrollmentNumber: value['enrollmentNumber'] ?? '',
  // companyName: value['companyName'] ?? '',
  // companyProfile: value['companyProfile'] ?? '',
  // startingDate: value['startingDate'] ?? '',
  // designation: value['designation'] ?? '',
  // location: value['location'] ?? '',
  void _showDetailsDialog(StudentStartup student) {
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
              Text('Company Name: ${student.companyName}'),
              Text('Company Profile: ${student.companyProfile}'),
              Text('Starting Date: ${student.startingDate}'),
              Text('Designation: ${student.designation}'),
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
                      'Student\'s Startup Details',
                      style: GoogleFonts.kufam(
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                          color: Color(0xff0CECDA)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        'Select Year: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      DropdownButton<String>(
                        dropdownColor: Colors.black,
                        value: _selectedYear,
                        items: <String>['2021','2022', '2023', '2024', '2025']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: TextStyle(color: Color(0xff0CECDA),),),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedYear = newValue!;
                            // Filter students by selected year
                            filteredStudents = students
                                .where((student) => student.startingDate.contains(_selectedYear))
                                .toList();
                          });
                        },
                      ),
                    ],
                  ),
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
