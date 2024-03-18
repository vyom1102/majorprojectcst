import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/main.dart';
// import 'package:majorproject/teacher_data_sheet_screen.dart';
// import 'package:majorproject/teacher_main_screen.dart';
// import 'package:majorproject/student_data_sheet_screen.dart';

class EventOrganisedScreen extends StatefulWidget {
  @override
  _EventOrganisedScreenState createState() => _EventOrganisedScreenState();
}

class _EventOrganisedScreenState extends State<EventOrganisedScreen> {
  final DatabaseReference _teacherRef =
  FirebaseDatabase.instance.ref().child('TeacherData').child('EventOrganised').child('WorkshopOrganized');

  final DatabaseReference _teacherRef2 =
  FirebaseDatabase.instance.ref().child('TeacherData').child('EventOrganised').child('ConferenceOrganized');

  final DatabaseReference _teacherRef3 =
  FirebaseDatabase.instance.ref().child('TeacherData').child('EventOrganised').child('SeminarOrganized');

  final DatabaseReference _teacherRef4 =
  FirebaseDatabase.instance.ref().child('TeacherData').child('EventOrganised').child('FDPOrganized');

  bool _showWorkshopOrganizedTextField = false; // Variable to toggle visibility of text fields
  bool _showConferenceOrganizedTextField = false; // Variable to toggle visibility of text fields
  bool _showSeminarOrganizedTextField = false; // Variable to toggle visibility of text fields
  bool _showFDPOrganizedTextField = false; // Variable to toggle visibility of text fields
  String selectedButton = '';

  DateTime WorkshopOrganizedHeldFromDate = DateTime.now();
  DateTime WorkshopOrganizedHeldToDate = DateTime.now();

  DateTime ConferenceOrganizedHeldFromDate = DateTime.now();
  DateTime ConferenceOrganizedHeldToDate = DateTime.now();

  DateTime SeminarOrganizedHeldFromDate = DateTime.now();
  DateTime SeminarOrganizedHeldToDate = DateTime.now();

  DateTime FDPOrganizedHeldFromDate = DateTime.now();
  DateTime FDPOrganizedHeldToDate = DateTime.now();

  //workshop organized button
  Future<void> _workshopOrganizedHeldFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: WorkshopOrganizedHeldFromDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != WorkshopOrganizedHeldFromDate) {
      setState(() {
        WorkshopOrganizedHeldFromDate = picked;
      });
    }
  }

  Future<void> _workshopOrganizedHeldToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: WorkshopOrganizedHeldToDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != WorkshopOrganizedHeldToDate) {
      setState(() {
        WorkshopOrganizedHeldToDate = picked;
      });
    }
  }

  //conference organized button
  Future<void> _conferenceOrganizedHeldFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: ConferenceOrganizedHeldFromDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != ConferenceOrganizedHeldFromDate) {
      setState(() {
        ConferenceOrganizedHeldFromDate = picked;
      });
    }
  }

  Future<void> _conferenceOrganizedHeldToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: ConferenceOrganizedHeldToDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != ConferenceOrganizedHeldToDate) {
      setState(() {
        ConferenceOrganizedHeldToDate = picked;
      });
    }
  }

  //seminar organised button
  Future<void> _seminarOrganizedHeldFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: SeminarOrganizedHeldFromDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != SeminarOrganizedHeldFromDate) {
      setState(() {
        SeminarOrganizedHeldFromDate = picked;
      });
    }
  }

  Future<void> _seminarOrganizedHeldToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: SeminarOrganizedHeldToDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != SeminarOrganizedHeldToDate) {
      setState(() {
        SeminarOrganizedHeldToDate = picked;
      });
    }
  }

  //fdp organised button
  Future<void> _fDPOrganizedHeldFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: FDPOrganizedHeldFromDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != FDPOrganizedHeldFromDate) {
      setState(() {
        FDPOrganizedHeldFromDate = picked;
      });
    }
  }

  Future<void> _fDPOrganizedHeldToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: FDPOrganizedHeldToDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != FDPOrganizedHeldToDate) {
      setState(() {
        FDPOrganizedHeldToDate = picked;
      });
    }
  }
  Future<void> _saveTeacherData() async {
    String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(WorkshopOrganizedHeldFromDate);
    String formattedJoiningDate = DateFormat('yyyy-MM-dd').format(WorkshopOrganizedHeldToDate);
    try {
      await _teacherRef.child('id').child(_fullNameController.text).set({
        'fullName': _fullNameController.text,
        'detailsOfWorkshop': _detailsController.text,
        'duration': _durationController.text,
        'address': _addressController.text,
        'StartingDate' : formattedSelectedDate,
        'EndingDate' : formattedJoiningDate,
      });

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }
  Future<void> _saveTeacher2Data() async {
    String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(ConferenceOrganizedHeldFromDate);
    String formattedJoiningDate = DateFormat('yyyy-MM-dd').format(ConferenceOrganizedHeldToDate);
    try {
      await _teacherRef2.child('id').child(_fullName2Controller.text).set({
        'fullName': _fullName2Controller.text,
        'detailsOfConference': _details2Controller.text,
        'duration': _duration2Controller.text,
        'address': _address2Controller.text,
        'StartingDate' : formattedSelectedDate,
        'EndingDate' : formattedJoiningDate,
      });

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }
  Future<void> _saveTeacher3Data() async {
    String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(SeminarOrganizedHeldFromDate);
    String formattedJoiningDate = DateFormat('yyyy-MM-dd').format(SeminarOrganizedHeldToDate);
    try {
      await _teacherRef3.child('id').child(_fullName3Controller.text).set({
        'fullName': _fullName3Controller.text,
        'detailsOfSeminar': _details3Controller.text,
        'duration': _duration3Controller.text,
        'address': _address3Controller.text,
        'StartingDate' : formattedSelectedDate,
        'EndingDate' : formattedJoiningDate,
      });

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }
  Future<void> _saveTeacher4Data() async {
    String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(FDPOrganizedHeldFromDate);
    String formattedJoiningDate = DateFormat('yyyy-MM-dd').format(FDPOrganizedHeldToDate);
    try {
      await _teacherRef4.child('id').child(_fullName4Controller.text).set({
        'fullName': _fullName4Controller.text,
        'detailsOfFDP': _details4Controller.text,
        'duration': _duration4Controller.text,
        'address': _address4Controller.text,
        'StartingDate' : formattedSelectedDate,
        'EndingDate' : formattedJoiningDate,
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
              height: MediaQuery.sizeOf(context).height*0.185,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                'Event Organized',
                style: GoogleFonts.kufam(
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                  color: Color(0xff0CECDA),
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    // Workshop Organized Button
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child:
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _showWorkshopOrganizedTextField = !_showWorkshopOrganizedTextField;
                          });
                        },
                        icon: Icon(
                          _showWorkshopOrganizedTextField ? Icons.remove : Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: Text(
                          _showWorkshopOrganizedTextField ? 'Workshop Organized' : 'Workshop Organized',
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
                    if (_showWorkshopOrganizedTextField) ...[
                      Container(
                        padding: EdgeInsets.all(16.0),
                          child:
                      Column(
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
                          Text('Details of the workshop organized',
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
                                  onTap: () => _workshopOrganizedHeldFromDate(context),
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
                                    text: "${WorkshopOrganizedHeldFromDate.toLocal()}".split(' ')[0],
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () => _workshopOrganizedHeldFromDate(context),
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
                                  onTap: () => _workshopOrganizedHeldToDate(context),
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
                                    text: "${WorkshopOrganizedHeldToDate.toLocal()}".split(' ')[0],
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () =>
                                    _workshopOrganizedHeldToDate(context),
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
                      ),),
                    ],

                    // Conference Organized Button
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child:
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _showConferenceOrganizedTextField = !_showConferenceOrganizedTextField;
                          });
                        },
                        icon: Icon(
                          _showConferenceOrganizedTextField ? Icons.remove : Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: Text(
                          _showConferenceOrganizedTextField ? 'Conference Organized' : 'Conference Organized',
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
                    if (_showConferenceOrganizedTextField) ...[
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
                            Text('Details of the Conference organized',
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
                                    onTap: () => _conferenceOrganizedHeldFromDate(context),
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
                                      text: "${ConferenceOrganizedHeldFromDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () => _conferenceOrganizedHeldFromDate(context),
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
                                    onTap: () => _conferenceOrganizedHeldToDate(context),
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
                                      text: "${ConferenceOrganizedHeldToDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () =>
                                      _conferenceOrganizedHeldToDate(context),
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

                    //Seminar Organized Button
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child:
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _showSeminarOrganizedTextField = !_showSeminarOrganizedTextField;
                          });
                        },
                        icon: Icon(
                          _showSeminarOrganizedTextField ? Icons.remove : Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: Text(
                          _showSeminarOrganizedTextField ? 'Seminar Organized' : 'Seminar Organized',
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
                    if (_showSeminarOrganizedTextField) ...[
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
                            Text('Details of the Seminar organized',
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
                                    onTap: () => _seminarOrganizedHeldFromDate(context),
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
                                      text: "${SeminarOrganizedHeldFromDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () => _seminarOrganizedHeldFromDate(context),
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
                                    onTap: () => _seminarOrganizedHeldToDate(context),
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
                                      text: "${SeminarOrganizedHeldToDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () =>
                                      _seminarOrganizedHeldToDate(context),
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

                    //FDP Organized Button
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child:
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _showFDPOrganizedTextField = !_showFDPOrganizedTextField;
                          });
                        },
                        icon: Icon(
                          _showFDPOrganizedTextField ? Icons.remove : Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: Text(
                          _showFDPOrganizedTextField ? 'FDP Organized' : 'FDP Organized',
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
                    if (_showFDPOrganizedTextField) ...[
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
                            Text('Details of the FDP organized',
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
                                    onTap: () => _fDPOrganizedHeldFromDate(context),
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
                                      text: "${FDPOrganizedHeldFromDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () => _fDPOrganizedHeldFromDate(context),
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
                                    onTap: () => _fDPOrganizedHeldToDate(context),
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
                                      text: "${FDPOrganizedHeldToDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () =>
                                      _fDPOrganizedHeldToDate(context),
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
                            // Add more text fields as needed
                          ],
                        ),
                      ),
                    ],


                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_fullNameController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventOrganisedScreen(),
                      ),
                    );
                    _saveTeacherData();
                  }
                  if (_fullName2Controller.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventOrganisedScreen(),
                      ),
                    );
                    _saveTeacher2Data();
                  }
                  if (_fullName3Controller.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventOrganisedScreen(),
                      ),
                    );
                    _saveTeacher3Data();
                  }
                  if (_fullName4Controller.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventOrganisedScreen(),
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
                  minimumSize: Size(
                    0.9 * MediaQuery.of(context).size.width,
                    48.0,
                  ),
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
            ],

          ),
        ],
      ),
    );
  }
}
