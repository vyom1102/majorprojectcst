import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentCommEventParticipation {
  final String id;
  final String enrollmentNumber;
  final String eventName;
  //final String nameOfSociety;
 // final String roleInSociety;
  final String details;
  final String duration;
  final String startingDate;
  final String endingDate;
  final String address;
  //inal String individualGroup;
  //final String achievement;

  StudentCommEventParticipation({
    required this.id,
    required this.enrollmentNumber,
    required this.eventName,
    //required this.nameOfSociety,
    //required this.roleInSociety,
    required this.details,
    required this.duration,
    required this.startingDate,
    required this.endingDate,
    required this.address,
    //required this.individualGroup,
    //required this.achievement,
  });
}

class StudentDramaEventOrganisedList extends StatefulWidget {
  @override
  _StudentDramaEventOrganisedListState createState() =>
      _StudentDramaEventOrganisedListState();
}

class _StudentDramaEventOrganisedListState
    extends State<StudentDramaEventOrganisedList> {
  final DatabaseReference _membersRef = FirebaseDatabase.instance
      .ref()
      .child(
      'StudentData/Co-CurricularData/DramaSocietyData/studentDramaEventOrganized/id');
  List<StudentCommEventParticipation> students = [];
  List<StudentCommEventParticipation> filteredStudents = [];
  TextEditingController _searchController = TextEditingController();
  String _selectedYear = '2024';

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    try {
      _membersRef.onValue.listen((event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          final List<StudentCommEventParticipation> fetchedStudents = [];
          data.forEach((key, value) {
            fetchedStudents.add(StudentCommEventParticipation(
              id: key.toString(),
              enrollmentNumber: value['enrollmentNumber'] ?? '',
              eventName: value['eventName'] ?? '',
              //nameOfSociety: value['nameOfSociety'] ?? '',
              //roleInSociety: value['roleInSociety'] ?? '',
              details: value['details'] ?? '',
              duration: value['duration'] ?? '',
              startingDate: value['StartingDate'] ?? '',
              endingDate: value['EndingDate'] ?? '',
              address: value['address'] ?? '',
              // individualGroup: value['individualGroup'] ?? '',
              // achievement: value['achievement'] ?? '',
            ));
          });
          setState(() {
            students = fetchedStudents;
            filteredStudents = fetchedStudents;
          });
        }
      });
    } catch (error) {
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

  void _showDetailsDialog(StudentCommEventParticipation student) {
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
              Text('Enrollment Number: ${student.enrollmentNumber}'),
              Text('Event Name: ${student.eventName}'),
              //Text('Name of Society: ${student.nameOfSociety}'),
              //Text('Role in Society: ${student.roleInSociety}'),
              Text('Details: ${student.details}'),
              Text('Duration: ${student.duration}'),
              Text('Starting Date: ${student.startingDate}'),
              Text('Ending Date: ${student.endingDate}'),
              Text('Address: ${student.address}'),
              //  Text('Individual/Group: ${student.individualGroup}'),
              // Text('Achievement: ${student.achievement}'),
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
                    'Other Event Organisation ',
                    style: GoogleFonts.kufam(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Color(0xff0CECDA),
                    ),
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
                padding: const EdgeInsets.all(8.0),
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
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: Text(
                              '${filteredStudents[index].enrollmentNumber.toUpperCase()}',
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
