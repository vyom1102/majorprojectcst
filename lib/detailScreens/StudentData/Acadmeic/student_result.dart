// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// // class StudentResult {
// //   final String id;
// //
// //   final String enrollmentNumber;
// //   final String sem1;
// //   final String sem2;
// //   final String sem3;
// //   final String sem4;
// //   final String sem5;
// //   final String sem6;
// //   final String sem7;
// //   final String sem8;
// //   final String overall;
// //
// //
// //   StudentResult({
// //     required this.id,
// //     required this.enrollmentNumber,
// //     required this.sem1,
// //     required this.sem2,
// //     required this.sem3,
// //     required this.sem4,
// //     required this.sem5,
// //     required this.sem6,
// //     required this.sem7,
// //     required this.sem8,
// //     required this.overall,
// //   });
// // }
// //
// //
// // class StudentResultList extends StatefulWidget {
// //   @override
// //   _StudentResultListState createState() => _StudentResultListState();
// // }
// //
// // class _StudentResultListState extends State<StudentResultList> {
// //   final databaseReference = FirebaseDatabase.instance.ref();
// //   late DatabaseReference _membersRef;
// //
// //   List<StudentResult> students = [];
// //   List<StudentResult> filteredStudents = [];
// //
// //   TextEditingController _searchController = TextEditingController();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _membersRef = FirebaseDatabase.instance.ref().child('StudentData/Academic/studentResult/id');
// //     fetchStudents();
// //   }
// //
// //   Future<void> fetchStudents() async {
// //     try {
// //       _membersRef.onValue.listen((event) {
// //         final data = event.snapshot.value as Map<dynamic, dynamic>?;
// //         if (data != null) {
// //           final List<StudentResult> fetchedStudents = [];
// //           data.forEach((key, value) {
// //             fetchedStudents.add(StudentResult(
// //               id: key.toString(),
// //               enrollmentNumber: value['enrollmentNumber'] ?? '',
// //               sem1: value['sem1'] ?? '',
// //               sem2: value['sem2'] ?? '',
// //               sem3: value['sem3'] ?? '',
// //               sem4: value['sem4'] ?? '',
// //               sem5: value['sem5'] ?? '',
// //               sem6: value['sem6'] ?? '',
// //               sem7: value['sem7'] ?? '',
// //               sem8: value['sem8'] ?? '',
// //               overall: value['overall'] ?? '',
// //             ));
// //           });
// //           setState(() {
// //             students = fetchedStudents;
// //             filteredStudents = fetchedStudents;
// //           });
// //         }
// //       });
// //     } catch (error) {
// //       // Handle the error
// //       print('Error fetching students: $error');
// //     }
// //   }
// //
// //   void _filterStudents(String query) {
// //     setState(() {
// //       if (query.isNotEmpty) {
// //         filteredStudents = students.where((student) =>
// //         student.enrollmentNumber.toLowerCase().contains(query.toLowerCase()) ||
// //             student.id.toLowerCase().contains(query.toLowerCase())).toList();
// //       } else {
// //         filteredStudents = students;
// //       }
// //     });
// //   }
// //
// //   void _showDetailsDialog(StudentResult student) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: Text('Student Details'),
// //           content: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               Text('ID: ${student.id}'),
// //               Text('Enrollment Number: ${student.enrollmentNumber}'),
// //               Text('Sem 1: ${student.sem1}'),
// //               Text('Sem 2: ${student.sem2}'),
// //               Text('Sem 3: ${student.sem3}'),
// //               Text('Sem 4: ${student.sem4}'),
// //               Text('Sem 5: ${student.sem5}'),
// //               Text('Sem 6: ${student.sem6}'),
// //               Text('Sem 7: ${student.sem7}'),
// //               Text('Sem 8: ${student.sem8}'),
// //               Text('Overall: ${student.overall}'),
// //             ],
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.pop(context);
// //               },
// //               child: Text('Close'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color(0xff141318),
// //
// //       body: Stack(
// //           children: [
// //             Positioned(
// //               top: 0,
// //               left: 0,
// //               right: 0,
// //               child: Image.asset(
// //                 'images/bottom_container.png',
// //                 fit: BoxFit.cover,
// //                 height: 200,
// //                 width: MediaQuery.sizeOf(context)
// //                     .width, // Adjust the height as needed
// //               ),
// //             ),
// //             Column(
// //               children: [
// //                 SizedBox(height: MediaQuery.sizeOf(context).height*0.1,),
// //                 Row(
// //                   children: [
// //                     SizedBox(width: 10,),
// //                     Text(
// //                       'Student\'s Result Details',
// //                       style: GoogleFonts.kufam(
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 26,
// //                           color: Color(0xff0CECDA)),
// //                     ),
// //                   ],
// //                 ),
// //
// //                 Padding(
// //                   padding: const EdgeInsets.all(2.0),
// //                   child: TextField(
// //                     controller: _searchController,
// //                     decoration: InputDecoration(
// //                       labelText: 'Search by Name or ID',
// //                       prefixIcon: Icon(Icons.search),
// //                       filled: true,
// //                       fillColor: Colors.white,
// //                       border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(30.0),
// //                       ),
// //                     ),
// //                     onChanged: _filterStudents,
// //                   ),
// //                 ),
// //
// //                 Expanded(
// //                   child: ListView.builder(
// //                     itemCount: filteredStudents.length,
// //                     itemBuilder: (context, index) {
// //                       return Container(
// //                         height: 60,
// //                         child: Card(
// //                           color: Color(0xff2D2B33),
// //                           child: ListTile(
// //
// //
// //                             title:Padding(
// //                               padding: const EdgeInsets.only(bottom: 2.0),
// //                               child: Text('${filteredStudents[index].enrollmentNumber.toUpperCase()}',style: TextStyle(color:Colors.white),),
// //                             ),
// //
// //                             onTap: () {
// //                               _showDetailsDialog(filteredStudents[index]);
// //                             },
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ]
// //       ),
// //     );
// //   }
// // }
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class StudentResult {
//   final int id;
//   final int enrollmentNumber;
//   final String batch;
//   final double sem1;
//   final double sem2;
//   final double sem3;
//   final double sem4;
//   final double sem5;
//   final double sem6;
//   final double sem7;
//   final double sem8;
//   final double overall;
//
//   StudentResult({
//     required this.id,
//     required this.enrollmentNumber,
//     required this.batch,
//     required this.sem1,
//     required this.sem2,
//     required this.sem3,
//     required this.sem4,
//     required this.sem5,
//     required this.sem6,
//     required this.sem7,
//     required this.sem8,
//     required this.overall,
//   });
// }
//
// class StudentResultList extends StatefulWidget {
//   @override
//   _StudentResultListState createState() => _StudentResultListState();
// }
//
// class _StudentResultListState extends State<StudentResultList> {
//   final databaseReference = FirebaseDatabase.instance.ref();
//   late DatabaseReference _membersRef;
//
//   List<StudentResult> students = [];
//   List<StudentResult> filteredStudents = [];
//
//   TextEditingController _searchController = TextEditingController();
//   String _selectedYear = '2024';
//   String _selectedYearRange = '2020-2024';
//   List<String> years = ['2020-2024','2021-2025', '2022-2026', '2023-2027', '2024-2028'];
//   @override
//   void initState() {
//     super.initState();
//     _membersRef = FirebaseDatabase.instance.ref().child('StudentData/Academic/studentResult/id');
//     fetchStudents();
//   }
//
//   Future<void> fetchStudents() async {
//     try {
//       _membersRef.onValue.listen((event) {
//         final data = event.snapshot.value as Map<dynamic, dynamic>?;
//         if (data != null) {
//           final List<StudentResult> fetchedStudents = [];
//           data.forEach((key, value) {
//             fetchedStudents.add(StudentResult(
//               id: int.parse(key.toString()),
//               enrollmentNumber: int.parse(value['enrollmentNumber'].toString()),
//               batch: value['batch'] ?? '',
//               sem1: double.parse(value['sem1'].toString()),
//               sem2: double.parse(value['sem2'].toString()),
//               sem3: double.parse(value['sem3'].toString()),
//               sem4: double.parse(value['sem4'].toString()),
//               sem5: double.parse(value['sem5'].toString()),
//               sem6: double.parse(value['sem6'].toString()),
//               sem7: double.parse(value['sem7'].toString()),
//               sem8: double.parse(value['sem8'].toString()),
//               overall: double.parse(value['overall'].toString()),
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
//         student.enrollmentNumber.toString().toLowerCase().contains(query.toLowerCase()) ||
//             student.id.toString().toLowerCase().contains(query.toLowerCase())).toList();
//       } else {
//         filteredStudents = students;
//       }
//     });
//   }
//
//   void _showDetailsDialog(StudentResult student) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Student Details'),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // Text('ID: ${student.id}'),
//               Text('Enrollment Number: ${student.enrollmentNumber}'),
//               Text('Batch: ${student.batch}'),
//               Text('Sem 1: ${student.sem1}'),
//               Text('Sem 2: ${student.sem2}'),
//               Text('Sem 3: ${student.sem3}'),
//               Text('Sem 4: ${student.sem4}'),
//               Text('Sem 5: ${student.sem5}'),
//               Text('Sem 6: ${student.sem6}'),
//               Text('Sem 7: ${student.sem7}'),
//               Text('Sem 8: ${student.sem8}'),
//               Text('Overall: ${student.overall}'),
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
//       body: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Image.asset(
//               'images/bottom_container.png',
//               fit: BoxFit.cover,
//               height: 200,
//               width: MediaQuery.sizeOf(context).width, // Adjust the height as needed
//             ),
//           ),
//           Column(
//             children: [
//               SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
//               Row(
//                 children: [
//                   SizedBox(width: 10),
//                   Text(
//                     'Student\'s Result Details',
//                     style: GoogleFonts.kufam(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 26,
//                         color: Color(0xff0CECDA)),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Row(
//                   children: [
//                     SizedBox(width: 10),
//                     Text(
//                       'Select Year: ',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     DropdownButton<String>(
//                       dropdownColor: Colors.black,
//                       value: _selectedYear,
//                       items: <String>['2021','2022', '2023', '2024', '2025']
//                           .map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value,style: TextStyle(color: Color(0xff0CECDA),),),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           _selectedYear = newValue!;
//                           // Filter students by selected year
//                           filteredStudents = students
//                               .where((student) => student.batch.contains(_selectedYear))
//                               .toList();
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: _searchController,
//                   decoration: InputDecoration(
//                     labelText: 'Search by Enrollment Number',
//                     prefixIcon: Icon(Icons.search),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     floatingLabelBehavior: FloatingLabelBehavior.never,
//
//                   ),
//                   onChanged: _filterStudents,
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: filteredStudents.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       height: 60,
//                       child: Card(
//                         color: Color(0xff2D2B33),
//                         child: ListTile(
//                           title: Padding(
//                             padding: const EdgeInsets.only(bottom: 2.0),
//                             child: Text(
//                               '${filteredStudents[index].enrollmentNumber}',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                           onTap: () {
//                             _showDetailsDialog(filteredStudents[index]);
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentResult {
  final int id;
  final int enrollmentNumber;
  final String batch;
  final double sem1;
  final double sem2;
  final double sem3;
  final double sem4;
  final double sem5;
  final double sem6;
  final double sem7;
  final double sem8;
  final double overall;

  StudentResult({
    required this.id,
    required this.enrollmentNumber,
    required this.batch,
    required this.sem1,
    required this.sem2,
    required this.sem3,
    required this.sem4,
    required this.sem5,
    required this.sem6,
    required this.sem7,
    required this.sem8,
    required this.overall,
  });
}

class StudentResultList extends StatefulWidget {
  @override
  _StudentResultListState createState() => _StudentResultListState();
}

class _StudentResultListState extends State<StudentResultList> {
  final databaseReference = FirebaseDatabase.instance.ref();
  late DatabaseReference _membersRef;

  List<StudentResult> students = [];
  List<StudentResult> filteredStudents = [];

  TextEditingController _searchController = TextEditingController();
  List<String> years = ['2020-2024','2021-2025', '2022-2026', '2023-2027', '2024-2028'];
  String _selectedYearRange = '2020-2024';

  @override
  void initState() {
    super.initState();
    _membersRef = FirebaseDatabase.instance.ref().child('StudentData/Academic/studentResult/id');
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    try {
      _membersRef.onValue.listen((event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          final List<StudentResult> fetchedStudents = [];
          data.forEach((key, value) {
            fetchedStudents.add(StudentResult(
              id: int.parse(key.toString()),
              enrollmentNumber: int.parse(value['enrollmentNumber'].toString()),
              batch: value['batch'] ?? '',
              sem1: double.parse(value['sem1'].toString()),
              sem2: double.parse(value['sem2'].toString()),
              sem3: double.parse(value['sem3'].toString()),
              sem4: double.parse(value['sem4'].toString()),
              sem5: double.parse(value['sem5'].toString()),
              sem6: double.parse(value['sem6'].toString()),
              sem7: double.parse(value['sem7'].toString()),
              sem8: double.parse(value['sem8'].toString()),
              overall: double.parse(value['overall'].toString()),
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
        student.enrollmentNumber.toString().toLowerCase().contains(query.toLowerCase()) ||
            student.id.toString().toLowerCase().contains(query.toLowerCase())).toList();
      } else {
        filteredStudents = students;
      }
    });
  }

  void _showDetailsDialog(StudentResult student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Student Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Enrollment Number: ${student.enrollmentNumber}'),
              Text('Batch: ${student.batch}'),
              Text('Sem 1: ${student.sem1}'),
              Text('Sem 2: ${student.sem2}'),
              Text('Sem 3: ${student.sem3}'),
              Text('Sem 4: ${student.sem4}'),
              Text('Sem 5: ${student.sem5}'),
              Text('Sem 6: ${student.sem6}'),
              Text('Sem 7: ${student.sem7}'),
              Text('Sem 8: ${student.sem8}'),
              Text('Overall: ${student.overall}'),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    'Student\'s Result Details',
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
                      'Select Year Range: ',
                      style: TextStyle(color: Colors.white),
                    ),
                    DropdownButton<String>(
                      dropdownColor: Colors.black,
                      value: _selectedYearRange,
                      items: years.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Color(0xff0CECDA)),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedYearRange = newValue!;
                          // Filter students by selected year range
                          final startYear = int.parse(_selectedYearRange.split('-')[0]);
                          final endYear = int.parse(_selectedYearRange.split('-')[1]);
                          filteredStudents = students.where((student) {
                            final batchYear = int.parse(student.batch);
                            return batchYear == startYear;
                          }).toList();
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                      height: MediaQuery.sizeOf(context).height*0.074,
                      child: Card(
                        color: Color(0xff2D2B33),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: Text(
                              '${filteredStudents[index].enrollmentNumber}',
                              style: TextStyle(color: Colors.white),
                            ),
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
        ],
      ),
    );
  }
}