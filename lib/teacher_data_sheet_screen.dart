//
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:majorproject/teacher_main_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class TeacherDataSheet extends StatefulWidget {
//   @override
//   _TeacherDataSheetState createState() => _TeacherDataSheetState();
// }
//
// class _TeacherDataSheetState extends State<TeacherDataSheet> {
//   DateTime selectedDate = DateTime.now();
//   DateTime joiningDate = DateTime.now();
//   final DatabaseReference _teacherRef =
//   FirebaseDatabase.instance.ref().child('teachers');
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//
//     if (picked != null && picked != selectedDate){
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }
//
//   Future <void> _joiningDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: joiningDate,
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//
//     if (picked != null && picked != joiningDate) {
//       setState(() {
//         joiningDate = picked;
//       });
//     }
//   }
//
//   Future<void> _saveTeacherData() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await _teacherRef.child('id').child(_employeeIdController.text).set({
//         'fullName': _fullNameController.text,
//         'emailAddress': _emailAddressController.text,
//         'employeeId': _employeeIdController.text,
//         'dateOfBirth': selectedDate.toLocal().toString(),
//         'joiningDate': joiningDate.toLocal().toString(),
//         'permanentAddress': _permanentAddressController.text,
//         'fatherHusbandName': _fatherHusbandNameController.text,
//         'highestQualification': _highestQualificationController.text,
//         'mobileNumber': _mobileNumberController.text,
//         'currentDesignation': _currentDesignationController.text,
//         'department': _departmentController.text,
//       });
//       await prefs.setString('fullName', _fullNameController.text);
//       String? storedFullName = prefs.getString('fullName');
//       print('Stored Full Name: $storedFullName');
//
//     } catch (error) {
//       // Handle the error
//       print('Error saving data: $error');
//     }
//   }
//
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailAddressController = TextEditingController();
//   final TextEditingController _employeeIdController = TextEditingController();
//   final TextEditingController _permanentAddressController =
//   TextEditingController();
//   final TextEditingController _fatherHusbandNameController =
//   TextEditingController();
//   final TextEditingController _highestQualificationController =
//   TextEditingController();
//   final TextEditingController _mobileNumberController = TextEditingController();
//   final TextEditingController _currentDesignationController =
//   TextEditingController();
//   final TextEditingController _departmentController = TextEditingController();
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
//               height: 150,
//               width: MediaQuery.of(context).size.width,
//             ),
//           ),
//           Column(
//               children: [
//                 SizedBox(
//                   height: 70,
//                 ),
//                 Text(
//                   'Teacher\'s Data Sheet',
//                   style: GoogleFonts.kufam(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 26,
//                       color: Color(0xff0CECDA)),
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Expanded(
//                   child: ListView(children: [
//                     Container(
//                       padding: EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Full Name',
//                               style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                           SizedBox(height: 5),
//                           TextFormField(
//                             controller: _fullNameController,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'This field is required';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               hintText: 'Shreya',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff0CECDA)),
//                               ),
//                               hintStyle: GoogleFonts.kufam(
//                                   color: Colors.white.withOpacity(0.5)),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20.0, horizontal: 15.0),
//                               border: OutlineInputBorder(),
//                               fillColor: Color(0xff141318),
//                               filled: true,
//                             ),
//                             style: TextStyle(color: Colors.white),),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text('Email Address',
//                               style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                           SizedBox(height: 5),
//                           TextField(
//                             controller: _emailAddressController,
//                             decoration: InputDecoration(
//                               hintText: 'shreya@gmail.com',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff0CECDA)),
//                               ),
//                               hintStyle: GoogleFonts.kufam(
//                                   color: Colors.white.withOpacity(0.5)),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20.0, horizontal: 15.0),
//                               border: OutlineInputBorder(),
//                               fillColor: Color(0xff141318),
//                               filled: true,
//                             ),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text('Employee Id',
//                               style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                           SizedBox(height: 5),
//                           TextField(
//                             controller: _employeeIdController,
//                             decoration: InputDecoration(
//                               hintText: '98753',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff0CECDA)),
//                               ),
//                               hintStyle: GoogleFonts.kufam(
//                                   color: Colors.white.withOpacity(0.5)),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20.0, horizontal: 15.0),
//                               border: OutlineInputBorder(),
//                               fillColor: Color(0xff141318),
//                               filled: true,
//                             ),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text('Date of Birth',
//                               style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                           SizedBox(height: 5),
//
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: TextFormField(
//                                   readOnly: true, // Disable manual editing
//                                   onTap: () => _selectDate(context),
//                                   decoration: InputDecoration(
//                                     hintText: 'Select a date',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                     ),
//                                     hintStyle: TextStyle(
//                                       color: Colors.white.withOpacity(0.5),
//                                     ),
//                                     contentPadding: const EdgeInsets.symmetric(
//                                       vertical: 20.0,
//                                       horizontal: 15.0,
//                                     ),
//                                     border: OutlineInputBorder(),
//                                     fillColor: Color(0xff141318),
//                                     filled: true,
//                                   ),
//                                   style: TextStyle(color: Colors.white),
//                                   controller: TextEditingController(
//                                     text: "${selectedDate.toLocal()}".split(' ')[0],
//                                   ),
//                                 ),
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.calendar_today),
//                                 onPressed: () => _selectDate(context),
//                                 color: Colors.white,
//                               ),
//                             ],
//                           ),
//
//                           SizedBox(
//                             height: 20,
//                           ),
//
//                           Text('Date of Joining',
//                               style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                           SizedBox(height: 5),
//
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: TextFormField(
//                                   readOnly: true, // Disable manual editing
//                                   onTap: () => _joiningDate(context),
//                                   decoration: InputDecoration(
//                                     hintText: 'Select a date',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                     ),
//                                     hintStyle: TextStyle(
//                                       color: Colors.white.withOpacity(0.5),
//                                     ),
//                                     contentPadding: const EdgeInsets.symmetric(
//                                       vertical: 20.0,
//                                       horizontal: 15.0,
//                                     ),
//                                     border: OutlineInputBorder(),
//                                     fillColor: Color(0xff141318),
//                                     filled: true,
//                                   ),
//                                   style: TextStyle(color: Colors.white),
//                                   controller: TextEditingController(
//                                     text: "${joiningDate.toLocal()}".split(' ')[0],
//                                   ),
//                                 ),
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.calendar_today),
//                                 onPressed: () => _joiningDate(context),
//                                 color: Colors.white,
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text('Permanent Address',
//                               style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                           SizedBox(height: 5),
//                           TextField(
//                             controller: _permanentAddressController,
//                             decoration: InputDecoration(
//                               hintText: 'Enter permanent address',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff0CECDA)),
//                               ),
//                               hintStyle: GoogleFonts.kufam(
//                                   color: Colors.white.withOpacity(0.5)),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20.0, horizontal: 15.0),
//                               border: OutlineInputBorder(),
//                               fillColor: Color(0xff141318),
//                               filled: true,
//                             ),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text('Father/Husband Name',
//                               style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                           SizedBox(height: 5),
//                           TextField(
//                             controller: _fatherHusbandNameController,
//                             decoration: InputDecoration(
//                               hintText: 'Enter Name',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff0CECDA)),
//                               ),
//                               hintStyle: GoogleFonts.kufam(
//                                   color: Colors.white.withOpacity(0.5)),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20.0, horizontal: 15.0),
//                               border: OutlineInputBorder(),
//                               fillColor: Color(0xff141318),
//                               filled: true,
//                             ),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text('Highest Qualification',
//                               style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                           SizedBox(height: 5),
//                           TextField(
//                             controller: _highestQualificationController,
//                             decoration: InputDecoration(
//                               hintText: 'Diploma/Degree',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff0CECDA)),
//                               ),
//                               hintStyle: GoogleFonts.kufam(
//                                   color: Colors.white.withOpacity(0.5)),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20.0, horizontal: 15.0),
//                               border: OutlineInputBorder(),
//                               fillColor: Color(0xff141318),
//                               filled: true,
//                             ),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text('Mobile No.',
//                               style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                           SizedBox(height: 5),
//                           TextField(
//                             controller: _mobileNumberController,
//                             decoration: InputDecoration(
//                               hintText: '98765XXXXX',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff0CECDA)),
//                               ),
//                               hintStyle: GoogleFonts.kufam(
//                                   color: Colors.white.withOpacity(0.5)),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20.0, horizontal: 15.0),
//                               border: OutlineInputBorder(),
//                               fillColor: Color(0xff141318),
//                               filled: true,
//                             ),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text('Current Designation',
//                               style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                           SizedBox(height: 5),
//                           TextField(
//                             controller: _currentDesignationController,
//                             decoration: InputDecoration(
//                               hintText: 'Enter Designation',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff0CECDA)),
//                               ),
//                               hintStyle: GoogleFonts.kufam(
//                                   color: Colors.white.withOpacity(0.5)),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20.0, horizontal: 15.0),
//                               border: OutlineInputBorder(),
//                               fillColor: Color(0xff141318),
//                               filled: true,
//                             ),
//                             style: TextStyle(color: Colors.white),
//                           ),
//
//                           SizedBox(height: 20),
//                           Text('Department',
//                               style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                           SizedBox(height: 5),
//                           TextField(
//                             controller: _departmentController,
//                             decoration: InputDecoration(
//                               hintText: 'CST/CSE',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Color(0xff0CECDA)),
//                               ),
//                               hintStyle: GoogleFonts.kufam(
//                                   color: Colors.white.withOpacity(0.5)),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20.0, horizontal: 15.0),
//                               border: OutlineInputBorder(),
//                               fillColor: Color(0xff141318),
//                               filled: true,
//                             ),
//                             style: TextStyle(color: Colors.white),
//                           ),
//
//                           SizedBox(height: 20),
//
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => TeacherSelectionScreen()),
//                               );
//                                _saveTeacherData();
//
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Color(0xFF13E9DC),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20.0),
//                               ),
//                               minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
//                             ),
//                             child: Text(
//                               'Next',
//                               style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                         ],
//                       ),
//                     ),
//                   ]),
//
//
//               ],
//             ),
//
//           );
//
//
//   }
// }
//
//
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/teacher_main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherDataSheet extends StatefulWidget {
  @override
  _TeacherDataSheetState createState() => _TeacherDataSheetState();
}

class _TeacherDataSheetState extends State<TeacherDataSheet> {
  DateTime selectedDate = DateTime.now();
  DateTime joiningDate = DateTime.now();
  final DatabaseReference _teacherRef =
  FirebaseDatabase.instance.ref().child('teachers');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate){
      setState(() {
        selectedDate = picked;
      });
    }
  }
  Future<void> saveTeacherEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('teacher_email', email);
  }

  Future<void> saveTeacherName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //await prefs.setString('teacher_name', name);
    await prefs.setString('teacher_name', name);
  }

  Future <void> _joiningDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: joiningDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != joiningDate) {
      setState(() {
        joiningDate = picked;
      });
    }
  }

  Future<void> _saveTeacherData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await _teacherRef.child('id').child(_employeeIdController.text).set({
        'fullName': _fullNameController.text,
        'emailAddress': _emailAddressController.text,
        'employeeId': _employeeIdController.text,
        'dateOfBirth': selectedDate.toLocal().toString(),
        'joiningDate': joiningDate.toLocal().toString(),
        'permanentAddress': _permanentAddressController.text,
        'fatherHusbandName': _fatherHusbandNameController.text,
        'highestQualification': _highestQualificationController.text,
        'mobileNumber': _mobileNumberController.text,
        'currentDesignation': _currentDesignationController.text,
        'department': _departmentController.text,
      });
      await prefs.setString('fullName', _fullNameController.text);
      String? storedFullName = prefs.getString('fullName');
      print('Stored Full Name: $storedFullName');

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _employeeIdController = TextEditingController();
  final TextEditingController _permanentAddressController =
  TextEditingController();
  final TextEditingController _fatherHusbandNameController =
  TextEditingController();
  final TextEditingController _highestQualificationController =
  TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _currentDesignationController =
  TextEditingController();
  final TextEditingController _departmentController = TextEditingController();

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
              height: 150,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  'Teacher\'s Data Sheet',
                  style: GoogleFonts.kufam(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      color: Color(0xff0CECDA)),
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: ListView(children: [
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Full Name',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          TextFormField(
                            controller: _fullNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Shreya',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff0CECDA)),
                              ),
                              hintStyle: GoogleFonts.kufam(
                                  color: Colors.white.withOpacity(0.5)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 15.0),
                              border: OutlineInputBorder(),
                              fillColor: Color(0xff141318),
                              filled: true,
                            ),
                            style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Email Address',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          TextField(
                            controller: _emailAddressController,
                            decoration: InputDecoration(
                              hintText: 'shreya@gmail.com',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff0CECDA)),
                              ),
                              hintStyle: GoogleFonts.kufam(
                                  color: Colors.white.withOpacity(0.5)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 15.0),
                              border: OutlineInputBorder(),
                              fillColor: Color(0xff141318),
                              filled: true,
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Employee Id',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          TextField(
                            controller: _employeeIdController,
                            decoration: InputDecoration(
                              hintText: '98753',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff0CECDA)),
                              ),
                              hintStyle: GoogleFonts.kufam(
                                  color: Colors.white.withOpacity(0.5)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 15.0),
                              border: OutlineInputBorder(),
                              fillColor: Color(0xff141318),
                              filled: true,
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Date of Birth',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),

                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: true, // Disable manual editing
                                  onTap: () => _selectDate(context),
                                  decoration: InputDecoration(
                                    hintText: 'Select a date',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xff0CECDA)),
                                    ),
                                    hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 15.0,
                                    ),
                                    border: OutlineInputBorder(),
                                    fillColor: Color(0xff141318),
                                    filled: true,
                                  ),
                                  style: TextStyle(color: Colors.white),
                                  controller: TextEditingController(
                                    text: "${selectedDate.toLocal()}".split(' ')[0],
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () => _selectDate(context),
                                color: Colors.white,
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          Text('Date of Joining',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),

                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: true, // Disable manual editing
                                  onTap: () => _joiningDate(context),
                                  decoration: InputDecoration(
                                    hintText: 'Select a date',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xff0CECDA)),
                                    ),
                                    hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 15.0,
                                    ),
                                    border: OutlineInputBorder(),
                                    fillColor: Color(0xff141318),
                                    filled: true,
                                  ),
                                  style: TextStyle(color: Colors.white),
                                  controller: TextEditingController(
                                    text: "${joiningDate.toLocal()}".split(' ')[0],
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () => _joiningDate(context),
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Permanent Address',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          TextField(
                            controller: _permanentAddressController,
                            decoration: InputDecoration(
                              hintText: 'Enter permanent address',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff0CECDA)),
                              ),
                              hintStyle: GoogleFonts.kufam(
                                  color: Colors.white.withOpacity(0.5)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 15.0),
                              border: OutlineInputBorder(),
                              fillColor: Color(0xff141318),
                              filled: true,
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Father/Husband Name',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          TextField(
                            controller: _fatherHusbandNameController,
                            decoration: InputDecoration(
                              hintText: 'Enter Name',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff0CECDA)),
                              ),
                              hintStyle: GoogleFonts.kufam(
                                  color: Colors.white.withOpacity(0.5)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 15.0),
                              border: OutlineInputBorder(),
                              fillColor: Color(0xff141318),
                              filled: true,
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Highest Qualification',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          TextField(
                            controller: _highestQualificationController,
                            decoration: InputDecoration(
                              hintText: 'Diploma/Degree',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff0CECDA)),
                              ),
                              hintStyle: GoogleFonts.kufam(
                                  color: Colors.white.withOpacity(0.5)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 15.0),
                              border: OutlineInputBorder(),
                              fillColor: Color(0xff141318),
                              filled: true,
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Mobile No.',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          TextField(
                            controller: _mobileNumberController,
                            decoration: InputDecoration(
                              hintText: '98765XXXXX',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff0CECDA)),
                              ),
                              hintStyle: GoogleFonts.kufam(
                                  color: Colors.white.withOpacity(0.5)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 15.0),
                              border: OutlineInputBorder(),
                              fillColor: Color(0xff141318),
                              filled: true,
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Current Designation',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          TextField(
                            controller: _currentDesignationController,
                            decoration: InputDecoration(
                              hintText: 'Enter Designation',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff0CECDA)),
                              ),
                              hintStyle: GoogleFonts.kufam(
                                  color: Colors.white.withOpacity(0.5)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 15.0),
                              border: OutlineInputBorder(),
                              fillColor: Color(0xff141318),
                              filled: true,
                            ),
                            style: TextStyle(color: Colors.white),
                          ),

                          SizedBox(height: 20),
                          Text('Department',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          TextField(
                            controller: _departmentController,
                            decoration: InputDecoration(
                              hintText: 'CST/CSE',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff0CECDA)),
                              ),
                              hintStyle: GoogleFonts.kufam(
                                  color: Colors.white.withOpacity(0.5)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 15.0),
                              border: OutlineInputBorder(),
                              fillColor: Color(0xff141318),
                              filled: true,
                            ),
                            style: TextStyle(color: Colors.white),
                          ),

                          SizedBox(height: 20),

                          // ElevatedButton(
                          //   onPressed: () async {
                          //     await saveTeacherName(_fullNameController.text);
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(builder: (context) => TeacherSelectionScreen()),
                          //     );
                          //      _saveTeacherData();
                          //
                          //   },
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: Color(0xFF13E9DC),
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(20.0),
                          //     ),
                          //     minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
                          //   ),
                          //   child: Text(
                          //     'Save',
                          //     style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
                          //   ),
                          // ),
                          ElevatedButton(
                            onPressed: () async {
                              // Save teacher name and email
                              await saveTeacherName(_fullNameController.text);
                              await saveTeacherEmail(_emailAddressController.text);

                              // Navigate to the teacher selection screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TeacherSelectionScreen()),
                              );

                              // Save other teacher data if needed
                              _saveTeacherData();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF13E9DC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
                            ),
                            child: Text(
                              'Save',
                              style: GoogleFonts.kufam(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                  ),
                ),
              ]),


        ],
      ),

    );


  }
}

