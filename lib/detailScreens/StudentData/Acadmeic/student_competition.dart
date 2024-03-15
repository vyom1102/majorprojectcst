import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentCompetition {
  final String id;
  final String hardwareSoftwareProject;
  final String branch;
  final String dateOfParticipation;
  final String member1Email;
  final String member1Enroll;
  final String member1Group;
  final String member1Name;
  final String member1WhatsappNumber;
  final String member2Email;
  final String member2Enroll;
  final String member2Group;
  final String member2Name;
  final String member2WhatsappNumber;
  final String member3Email;
  final String member3Enroll;
  final String member3Group;
  final String member3Name;
  final String member3WhatsappNumber;
  final String member4Email;
  final String member4Enroll;
  final String member4Group;
  final String member4Name;
  final String member4WhatsappNumber;
  final String member5Email;
  final String member5Enroll;
  final String member5Group;
  final String member5Name;
  final String member5WhatsappNumber;
  final String nameNationInternationalCompetition;
  final String otherMember;
  final String projectCoGuide;
  final String projectDomain;
  final String projectGuide;
  final String projectID;
  final String projectProblem;
  final String projectTitle;
  final String proofUpload;
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hardwareSoftwareProject': hardwareSoftwareProject,
      'branch': branch,
      'dateOfParticipation': dateOfParticipation,
      'member1Email': member1Email,
      'member1Enroll': member1Enroll,
      'member1Group': member1Group,
      'member1Name': member1Name,
      'member1WhatsappNumber': member1WhatsappNumber,
      'member2Email': member2Email,
      'member2Enroll': member2Enroll,
      'member2Group': member2Group,
      'member2Name': member2Name,
      'member2WhatsappNumber': member2WhatsappNumber,
      'member3Email': member3Email,
      'member3Enroll': member3Enroll,
      'member3Group': member3Group,
      'member3Name': member3Name,
      'member3WhatsappNumber': member3WhatsappNumber,
      'member4Email': member4Email,
      'member4Enroll': member4Enroll,
      'member4Group': member4Group,
      'member4Name': member4Name,
      'member4WhatsappNumber': member4WhatsappNumber,
      'member5Email': member5Email,
      'member5Enroll': member5Enroll,
      'member5Group': member5Group,
      'member5Name': member5Name,
      'member5WhatsappNumber': member5WhatsappNumber,
      'nameNationInternationalCompetition': nameNationInternationalCompetition,
      'otherMember': otherMember,
      'projectCoGuide': projectCoGuide,
      'projectDomain': projectDomain,
      'projectGuide': projectGuide,
      'projectID': projectID,
      'projectProblem': projectProblem,
      'projectTitle': projectTitle,
      'proofUpload': proofUpload,
    };
  }

  StudentCompetition({
    required this.id,
    required this.hardwareSoftwareProject,
    required this.branch,
    required this.dateOfParticipation,
    required this.member1Email,
    required this.member1Enroll,
    required this.member1Group,
    required this.member1Name,
    required this.member1WhatsappNumber,
    required this.member2Email,
    required this.member2Enroll,
    required this.member2Group,
    required this.member2Name,
    required this.member2WhatsappNumber,
    required this.member3Email,
    required this.member3Enroll,
    required this.member3Group,
    required this.member3Name,
    required this.member3WhatsappNumber,
    required this.member4Email,
    required this.member4Enroll,
    required this.member4Group,
    required this.member4Name,
    required this.member4WhatsappNumber,
    required this.member5Email,
    required this.member5Enroll,
    required this.member5Group,
    required this.member5Name,
    required this.member5WhatsappNumber,
    required this.nameNationInternationalCompetition,
    required this.otherMember,
    required this.projectCoGuide,
    required this.projectDomain,
    required this.projectGuide,
    required this.projectID,
    required this.projectProblem,
    required this.projectTitle,
    required this.proofUpload,
  });
}



// class StudentSeminarList extends StatefulWidget {
//   @override
//   _StudentSeminarListState createState() => _StudentSeminarListState();
// }
//
// class _StudentSeminarListState extends State<StudentSeminarList> {
//   final databaseReference = FirebaseDatabase.instance.ref();
//   late DatabaseReference _membersRef;
//
//   List<StudentSeminar> students = [];
//   List<StudentSeminar> filteredStudents = [];
//
//   TextEditingController _searchController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _membersRef = FirebaseDatabase.instance.ref().child('StudentData/Academic/studentSeminar/id');
//     fetchStudents();
//   }
//
//   Future<void> fetchStudents() async {
//     try {
//       _membersRef.onValue.listen((event) {
//         final data = event.snapshot.value as Map<dynamic, dynamic>?;
//         if (data != null) {
//           final List<StudentSeminar> fetchedStudents = [];
//           data.forEach((key, value) {
//             fetchedStudents.add(StudentSeminar(
//               id: key.toString(),
//               enrollmentNumber: value['enrollmentNumber'] ?? '',
//               facultyName: value['facultyName'] ?? '',
//               durationOfSeminar: value['durationOfSeminar'] ?? '',
//               startingDate: value['startingDate'] ?? '',
//               endingDate: value['endingDate'] ?? '',
//               detailSeminarAttended: value['detailSeminarAttended'] ?? '',
//               seminarAddress: value['seminarAddress'] ?? '',
//             ));
//           });
//           setState(() {
//             students = fetchedStudents;
//             filteredStudents = fetchedStudents;
//           });
//         }
//       });
//     } catch (error) {
//       // Handle the error
//       print('Error fetching students: $error');
//     }
//   }
//
//   void _filterStudents(String query) {
//     setState(() {
//       if (query.isNotEmpty) {
//         filteredStudents = students.where((student) =>
//         student.enrollmentNumber.toLowerCase().contains(query.toLowerCase()) ||
//             student.id.toLowerCase().contains(query.toLowerCase())).toList();
//       } else {
//         filteredStudents = students;
//       }
//     });
//   }
//
//   void _showDetailsDialog(StudentSeminar student) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Student Details'),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('ID: ${student.id}'),
//               Text('Enrollment Number: ${student.enrollmentNumber}'),
//               Text('Faculty Name: ${student.facultyName}'),
//               Text('Duration of Seminar: ${student.durationOfSeminar}'),
//               Text('Starting Date: ${student.startingDate}'),
//               Text('Ending Date: ${student.endingDate}'),
//               Text('Seminar Attended: ${student.detailSeminarAttended}'),
//               Text('Seminar Address: ${student.seminarAddress}'),
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
//                       'Student\'s Seminar Details',
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
//                     onChanged: _filterStudents,
//                   ),
//                 ),
//
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: filteredStudents.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         height: 60,
//                         child: Card(
//                           color: Color(0xff2D2B33),
//                           child: ListTile(
//
//
//                             title:Padding(
//                               padding: const EdgeInsets.only(bottom: 2.0),
//                               child: Text('${filteredStudents[index].enrollmentNumber.toUpperCase()}',style: TextStyle(color:Colors.white),),
//                             ),
//
//                             onTap: () {
//                               _showDetailsDialog(filteredStudents[index]);
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

class StudentCompetitionScreen extends StatefulWidget {
  @override
  _StudentCompetitionScreenState createState() => _StudentCompetitionScreenState();
}

class _StudentCompetitionScreenState extends State<StudentCompetitionScreen> {
  final databaseReference = FirebaseDatabase.instance.ref();
  late DatabaseReference _studentCompetitionRef;

  List<StudentCompetition> competitions = [];
  List<StudentCompetition> filteredCompetitions = [];

  TextEditingController _searchController = TextEditingController();
  String _selectedYear = '2024'; // Default selected year

  @override
  void initState() {
    super.initState();
    _studentCompetitionRef = FirebaseDatabase.instance.ref().child('StudentData/Academic/studentcompetition/id');
    fetchCompetitions();
  }

  Future<void> fetchCompetitions() async {
    try {
      _studentCompetitionRef.onValue.listen((event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          final List<StudentCompetition> fetchedCompetitions = [];
          data.forEach((key, value) {
            fetchedCompetitions.add(StudentCompetition(
              id: key.toString(),
              hardwareSoftwareProject: value['HardwareSoftwareProject'] ?? '',
              branch: value['branch'] ?? '',
              dateOfParticipation: value['dateOfParticipation'] ?? '',
              member1Email: value['member1Email'] ?? '',
              member1Enroll: value['member1Enroll'] ?? '',
              member1Group: value['member1Group'] ?? '',
              member1Name: value['member1Name'] ?? '',
              member1WhatsappNumber: value['member1WhatsappNumber'] ?? '',
              member2Email: value['member2Email'] ?? '',
              member2Enroll: value['member2Enroll'] ?? '',
              member2Group: value['member2Group'] ?? '',
              member2Name: value['member2Name'] ?? '',
              member2WhatsappNumber: value['member2WhatsappNumber'] ?? '',
              member3Email: value['member3Email'] ?? '',
              member3Enroll: value['member3Enroll'] ?? '',
              member3Group: value['member3Group'] ?? '',
              member3Name: value['member3Name'] ?? '',
              member3WhatsappNumber: value['member3WhatsappNumber'] ?? '',
              member4Email: value['member4Email'] ?? '',
              member4Enroll: value['member4Enroll'] ?? '',
              member4Group: value['member4Group'] ?? '',
              member4Name: value['member4Name'] ?? '',
              member4WhatsappNumber: value['member4WhatsappNumber'] ?? '',
              member5Email: value['member5Email'] ?? '',
              member5Enroll: value['member5Enroll'] ?? '',
              member5Group: value['member5Group'] ?? '',
              member5Name: value['member5Name'] ?? '',
              member5WhatsappNumber: value['member5WhatsappNumber'] ?? '',
              nameNationInternationalCompetition: value['nameNationInternationalCompetition'] ?? '',
              otherMember: value['otherMember'] ?? '',
              projectCoGuide: value['projectCoGuide'] ?? '',
              projectDomain: value['projectDomain'] ?? '',
              projectGuide: value['projectGuide'] ?? '',
              projectID: value['projectID'] ?? '',
              projectProblem: value['projectProblem'] ?? '',
              projectTitle: value['projectTitle'] ?? '',
              proofUpload: value['proofUpload'] ?? '',
            ));
          });
          setState(() {
            competitions = fetchedCompetitions;
            filteredCompetitions = fetchedCompetitions;
          });
        }
      });
    } catch (error) {
      // Handle the error
      print('Error fetching competitions: $error');
    }
  }

  void _filterCompetitions(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredCompetitions = competitions.where((student) =>
        student.member1Enroll.toLowerCase().contains(query.toLowerCase()) ||
            student.id.toLowerCase().contains(query.toLowerCase())).toList();
      } else {
        filteredCompetitions = competitions;
      }
    });
  }


  void _showDetailsDialog(StudentCompetition competition) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Competition Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var entry in competition.toMap().entries)
                  if (entry.value.toString().isNotEmpty)
                   Text('${entry.key}: ${entry.value}'),
              ],
            ),
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
                      'Student\'s Competition Details',
                      style: GoogleFonts.kufam(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
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
                            filteredCompetitions = competitions
                                .where((student) => student.dateOfParticipation.contains(_selectedYear))
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
                    onChanged: _filterCompetitions,
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: filteredCompetitions.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 60,
                        child: Card(
                          color: Color(0xff2D2B33),
                          child: ListTile(


                            title:Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: Text('${filteredCompetitions[index].member1Enroll.toUpperCase()}',style: TextStyle(color:Colors.white),),
                            ),

                            onTap: () {
                              _showDetailsDialog(filteredCompetitions[index]);
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