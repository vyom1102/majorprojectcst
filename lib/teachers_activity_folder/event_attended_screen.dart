import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/main.dart';
// import 'package:majorproject/teacher_data_sheet_screen.dart';
// import 'package:majorproject/teacher_main_screen.dart';
// import 'package:majorproject/student_data_sheet_screen.dart';

class EventAttendedScreen extends StatefulWidget {
  @override
  _EventAttendedScreenState createState() => _EventAttendedScreenState();
}

class _EventAttendedScreenState extends State<EventAttendedScreen> {
  final DatabaseReference _teacherRef =
  FirebaseDatabase.instance.ref().child('TeacherData').child('WorkshopAttend');

  final DatabaseReference _teacherRef2 =
  FirebaseDatabase.instance.ref().child('TeacherData').child('ConferenceAttended');

  final DatabaseReference _teacherRef3 =
  FirebaseDatabase.instance.ref().child('TeacherData').child('SeminarAttended');

  final DatabaseReference _teacherRef4 =
  FirebaseDatabase.instance.ref().child('TeacherData').child('FDPAttended');

  bool _showWorkshopAttendedTextField = false; // Variable to toggle visibility of text fields
  bool _showConferenceAttendedTextField = false; // Variable to toggle visibility of text fields
  bool _showSeminarAttendedTextField = false; // Variable to toggle visibility of text fields
  bool _showFDPAttendedTextField = false; // Variable to toggle visibility of text fields
  String selectedButton = '';
  DateTime WorkshopHeldFromDate = DateTime.now();
  DateTime WorkshopHeldToDate = DateTime.now();

  DateTime ConferenceHeldFromDate = DateTime.now();
  DateTime ConferenceHeldToDate = DateTime.now();

  DateTime SeminarHeldFromDate = DateTime.now();
  DateTime SeminarHeldToDate = DateTime.now();

  DateTime FDPHeldFromDate = DateTime.now();
  DateTime FDPHeldToDate = DateTime.now();

  //Workshop Attended
  Future<void> _workshopHeldFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: WorkshopHeldFromDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != WorkshopHeldFromDate) {
      setState(() {
        WorkshopHeldFromDate = picked;
      });
    }
  }

  Future<void> _workshopHeldToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: WorkshopHeldToDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != WorkshopHeldToDate) {
      setState(() {
        WorkshopHeldToDate = picked;
      });
    }
  }

  //Conference attended
  Future<void> _conferenceHeldFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: ConferenceHeldFromDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != ConferenceHeldFromDate) {
      setState(() {
        ConferenceHeldFromDate = picked;
      });
    }
  }

  Future<void> _conferenceHeldToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: ConferenceHeldToDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != ConferenceHeldToDate) {
      setState(() {
        ConferenceHeldToDate = picked;
      });
    }
  }

  //Seminar Attended
  Future<void> _seminarHeldFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: SeminarHeldFromDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != SeminarHeldFromDate) {
      setState(() {
        SeminarHeldFromDate = picked;
      });
    }
  }

  Future<void> _seminarHeldToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: SeminarHeldToDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != SeminarHeldToDate) {
      setState(() {
        SeminarHeldToDate = picked;
      });
    }
  }

  //Fdp attended

  Future<void> _fDPHeldFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: FDPHeldFromDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != FDPHeldFromDate) {
      setState(() {
        FDPHeldFromDate = picked;
      });
    }
  }

  Future<void> _fDPHeldToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: FDPHeldToDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != FDPHeldToDate) {
      setState(() {
        FDPHeldToDate = picked;
      });
    }
  }
  Future<void> _saveTeacherData() async {
    try {
      await _teacherRef.child('id').child(_fullNameController.text).set({
        'fullName': _fullNameController.text,
        'detailsOfSeminar': _detailsController.text,
        'duration': _durationController.text,
        'address': _addressController.text,
      });

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }
  Future<void> _saveTeacher2Data() async {
    try {
      await _teacherRef2.child('id').child(_fullName2Controller.text).set({
        'fullName': _fullName2Controller.text,
        'detailsOfSeminar': _details2Controller.text,
        'duration': _duration2Controller.text,
        'address': _address2Controller.text,
      });

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }
  Future<void> _saveTeacher3Data() async {
    try {
      await _teacherRef3.child('id').child(_fullName3Controller.text).set({
        'fullName': _fullName3Controller.text,
        'detailsOfSeminar': _details3Controller.text,
        'duration': _duration3Controller.text,
        'address': _address3Controller.text,
      });

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }
  Future<void> _saveTeacher4Data() async {
    try {
      await _teacherRef4.child('id').child(_fullName4Controller.text).set({
        'fullName': _fullName4Controller.text,
        'detailsOfSeminar': _details4Controller.text,
        'duration': _duration4Controller.text,
        'address': _address4Controller.text,
      });

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _addressController= TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  final TextEditingController _fullName2Controller = TextEditingController();
  final TextEditingController _details2Controller = TextEditingController();
  final TextEditingController _address2Controller= TextEditingController();
  final TextEditingController _duration2Controller = TextEditingController();

  final TextEditingController _fullName3Controller = TextEditingController();
  final TextEditingController _details3Controller = TextEditingController();
  final TextEditingController _address3Controller= TextEditingController();
  final TextEditingController _duration3Controller = TextEditingController();

  final TextEditingController _fullName4Controller = TextEditingController();
  final TextEditingController _details4Controller = TextEditingController();
  final TextEditingController _address4Controller= TextEditingController();
  final TextEditingController _duration4Controller = TextEditingController();


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              width: MediaQuery.of(context).size.width, // Adjust the height as needed
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                'Event Attended',
                style: GoogleFonts.kufam(
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                  color: Color(0xff0CECDA),
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    // Workshop Attended Button
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child:
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _showWorkshopAttendedTextField = !_showWorkshopAttendedTextField;
                          });
                        },
                        icon: Icon(
                          _showWorkshopAttendedTextField ? Icons.remove : Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: Text(
                          _showWorkshopAttendedTextField ? 'Workshop Attended' : 'Workshop Attended',
                          style: GoogleFonts.kufam(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(12, 236, 218, 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          minimumSize: Size(
                            0.9 * MediaQuery.of(context).size.width,
                            48.0,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 20),
                    if (_showWorkshopAttendedTextField) ...[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name of the faculty member',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
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
                                  borderSide: BorderSide(
                                    color: Color(0xff535353),
                                  ), // Color when not focused
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff0CECDA),
                                  ),
                                ),
                                hintStyle: GoogleFonts.kufam(
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
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Details of the workshop attended',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _detailsController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Abc ',
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
                            Text('Workshop held from',
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
                                    onTap: () => _workshopHeldFromDate(context),
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
                                      text: "${WorkshopHeldFromDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () => _workshopHeldFromDate(context),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Workshop held to',
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
                                    onTap: () => _workshopHeldToDate(context),
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
                                      text: "${WorkshopHeldToDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () =>
                                      _workshopHeldToDate(context),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Duration of workshop',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _durationController,
                              decoration: InputDecoration(
                                hintText: '2 months',
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
                            // SizedBox(
                            //   height: 20,
                            // ),

                            SizedBox(
                              height: 20,
                            ),
                            Text('Address of the place where workshop held',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _addressController,
                              decoration: InputDecoration(
                                hintText: 'Enter the Address',
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
                            // Add more text fields as needed
                          ],
                        ),
                      ),
                    ],

                    // Conference Attended Button
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child:
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _showConferenceAttendedTextField = !_showConferenceAttendedTextField;
                          });
                        },
                        icon: Icon(
                          _showConferenceAttendedTextField ? Icons.remove : Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: Text(
                          _showConferenceAttendedTextField ? 'Conference Attended' : 'Conference Attended',
                          style: GoogleFonts.kufam(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(12, 236, 218, 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          minimumSize: Size(
                            0.9 * MediaQuery.of(context).size.width,
                            48.0,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 20),
                    if (_showConferenceAttendedTextField) ...[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name of the Faculty Member',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),

                            TextFormField(
                              controller: _fullName2Controller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Shreya',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff535353),
                                  ), // Color when not focused
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff0CECDA),
                                  ),
                                ),
                                hintStyle: GoogleFonts.kufam(
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
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Details of the Conference attended',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _details2Controller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Abc ',
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
                            Text('Conference held from',
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
                                    onTap: () => _conferenceHeldFromDate(context),
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
                                      text: "${ConferenceHeldFromDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () => _conferenceHeldFromDate(context),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Conference held to',
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
                                    onTap: () => _conferenceHeldToDate(context),
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
                                      text: "${ConferenceHeldToDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () =>
                                      _conferenceHeldToDate(context),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Duration of Conference',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _duration2Controller,
                              decoration: InputDecoration(
                                hintText: '2 months',
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
                            // SizedBox(
                            //   height: 20,
                            // ),

                            SizedBox(
                              height: 20,
                            ),
                            Text('Address of the place where conference held',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _address2Controller,
                              decoration: InputDecoration(
                                hintText: 'Enter the Address',
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
                            // Add more text fields as needed
                          ],
                        ),
                      ),
                    ],

                    //Seminar Attended Button
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child:
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _showSeminarAttendedTextField = !_showSeminarAttendedTextField;
                          });
                        },
                        icon: Icon(
                          _showSeminarAttendedTextField ? Icons.remove : Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: Text(
                          _showSeminarAttendedTextField ? 'Seminar Attended' : 'Seminar Attended',
                          style: GoogleFonts.kufam(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(12, 236, 218, 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          minimumSize: Size(
                            0.9 * MediaQuery.of(context).size.width,
                            48.0,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 20),
                    if (_showSeminarAttendedTextField) ...[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name of the Faculty Member',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),

                            TextFormField(
                              controller: _fullName3Controller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Shreya',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff535353),
                                  ), // Color when not focused
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff0CECDA),
                                  ),
                                ),
                                hintStyle: GoogleFonts.kufam(
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
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Details of the Seminar attended',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _details3Controller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Abc ',
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
                            Text('Seminar held from',
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
                                    onTap: () => _seminarHeldFromDate(context),
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
                                      text: "${SeminarHeldFromDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () => _seminarHeldFromDate(context),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Seminar held to',
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
                                    onTap: () => _seminarHeldToDate(context),
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
                                      text: "${SeminarHeldToDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () =>
                                      _seminarHeldToDate(context),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Duration of Seminar',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _duration3Controller,
                              decoration: InputDecoration(
                                hintText: '2 months',
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
                            // SizedBox(
                            //   height: 20,
                            // ),

                            SizedBox(
                              height: 20,
                            ),
                            Text('Address of the place where seminar held',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _address3Controller,
                              decoration: InputDecoration(
                                hintText: 'Enter the Address',
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
                            // Add more text fields as needed
                          ],
                        ),
                      ),
                    ],

                    //FDP Attended Button
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child:
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _showFDPAttendedTextField = !_showFDPAttendedTextField;
                          });
                        },
                        icon: Icon(
                          _showFDPAttendedTextField ? Icons.remove : Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: Text(
                          _showFDPAttendedTextField ? 'FDP Attended' : 'FDP Attended',
                          style: GoogleFonts.kufam(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(12, 236, 218, 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          minimumSize: Size(
                            0.9 * MediaQuery.of(context).size.width,
                            48.0,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 20),
                    if (_showFDPAttendedTextField) ...[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name of the Faculty Member',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),

                            TextFormField(
                              controller: _fullName4Controller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Shreya',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff535353),
                                  ), // Color when not focused
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff0CECDA),
                                  ),
                                ),
                                hintStyle: GoogleFonts.kufam(
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
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Details of the FDP attended',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _details4Controller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Abc ',
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
                            Text('FDP held from',
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
                                    onTap: () => _fDPHeldFromDate(context),
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
                                      text: "${FDPHeldFromDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () => _fDPHeldFromDate(context),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('FDP held to',
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
                                    onTap: () => _fDPHeldToDate(context),
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
                                      text: "${FDPHeldToDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () =>
                                      _fDPHeldToDate(context),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Duration of FDP',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _duration4Controller,
                              decoration: InputDecoration(
                                hintText: '2 months',
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
                            // SizedBox(
                            //   height: 20,
                            // ),

                            SizedBox(
                              height: 20,
                            ),
                            Text('Address of the place where FDP held',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _address4Controller,
                              decoration: InputDecoration(
                                hintText: 'Enter the Address',
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
                            ElevatedButton(
                              onPressed: () {
                                if (_fullNameController.text.isNotEmpty) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EventAttendedScreen(),
                                    ),
                                  );
                                  _saveTeacherData();
                                }
                                if (_fullName2Controller.text.isNotEmpty) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EventAttendedScreen(),
                                    ),
                                  );
                                  _saveTeacher2Data();
                                }
                                if (_fullName3Controller.text.isNotEmpty) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EventAttendedScreen(),
                                    ),
                                  );
                                  _saveTeacher3Data();
                                }
                                if (_fullName4Controller.text.isNotEmpty) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EventAttendedScreen(),
                                    ),
                                  );
                                  _saveTeacher4Data();
                                }
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
                                style: GoogleFonts.kufam(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            // Add more text fields as needed
                          ],
                        ),
                      ),
                    ],


                  ],
                ),
              ),

            ],

          ),
        ],
      ),
    );
  }
}
