import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/main.dart';
// import 'package:majorproject/teacher_data_sheet_screen.dart';
// import 'package:majorproject/teacher_main_screen.dart';
// import 'package:majorproject/student_data_sheet_screen.dart';
import 'package:quickalert/quickalert.dart';

class CommunityServiceScreen extends StatefulWidget {
  @override
  _CommunityServiceScreenState createState() => _CommunityServiceScreenState();
}

class _CommunityServiceScreenState extends State<CommunityServiceScreen> {
  final DatabaseReference _studentComm =
  FirebaseDatabase.instance.ref().child('StudentData').child('Co-CurricularData').child('CommunityData').child('studentCommunityEventOrganized');
  final DatabaseReference _studentCommunity =
  FirebaseDatabase.instance.ref().child('StudentData').child('Co-CurricularData').child('CommunityData').child('studentCommunityEventParticipation');
  bool _showWorkshopOrganizedTextField = false; // Variable to toggle visibility of text fields
  bool _showConferenceOrganizedTextField = false; // Variable to toggle visibility of text fields
  String selectedButton = '';

  DateTime WorkshopOrganizedHeldFromDate = DateTime.now();
  DateTime WorkshopOrganizedHeldToDate = DateTime.now();

  DateTime ConferenceOrganizedHeldFromDate = DateTime.now();
  DateTime ConferenceOrganizedHeldToDate = DateTime.now();

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
  Future<void> _saveStudentResultData() async {
    String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(WorkshopOrganizedHeldFromDate);
    String formattedJoiningDate = DateFormat('yyyy-MM-dd').format(WorkshopOrganizedHeldToDate);
    try {
      await _studentComm.child('id').child(_studentnameController.text).set({
        'enrollmentNumber': _studentnameController.text,
        'nameOfSociety' : _nameController.text,
        'roleInSociety' : _rollController.text,
        'eventName' : _eventNameController.text,
        'details' : _detailsController.text,
        'duration' : _durationController.text,
        'address' : _addressController.text,
        'StartingDate' : formattedSelectedDate,
        'EndingDate' : formattedJoiningDate,
      });

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }
  Future<void> _saveStudent2ResultData() async {
    String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(ConferenceOrganizedHeldFromDate);
    String formattedJoiningDate = DateFormat('yyyy-MM-dd').format(ConferenceOrganizedHeldToDate);
    try {
      await _studentCommunity.child('id').child(_student2nameController.text).set({
        'enrollmentNumber': _student2nameController.text,
        'nameOfSociety' : _name2Controller.text,
        'roleInSociety' : _roll2Controller.text,
        'eventName' : _eventName2Controller.text,
        'details' : _details2Controller.text,
        'duration' : _duration2Controller.text,
        'individualGroup' : _indiOrGroupController.text,
        'achievement' : _achievementsController.text,
        'address' : _address2Controller.text,
        'StartingDate' : formattedSelectedDate,
        'EndingDate' : formattedJoiningDate,
      });

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollController = TextEditingController();
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _studentnameController = TextEditingController();


  final TextEditingController _name2Controller = TextEditingController();
  final TextEditingController _roll2Controller = TextEditingController();
  final TextEditingController _eventName2Controller = TextEditingController();
  final TextEditingController _details2Controller = TextEditingController();
  final TextEditingController _duration2Controller = TextEditingController();
  final TextEditingController _indiOrGroupController = TextEditingController();
  final TextEditingController _achievementsController = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _student2nameController = TextEditingController();


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
              width: MediaQuery.of(context).size.width, // Adjust the height as needed
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height*0.085,
              ),
              Text(
                'Community Service',
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
                            _showConferenceOrganizedTextField = false;
                          });
                        },
                        icon: Icon(
                          _showWorkshopOrganizedTextField ? Icons.remove : Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: Text(
                          _showWorkshopOrganizedTextField ? 'Event Organized' : 'Event Organized',
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
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Enrollment number of Student  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Enrollment number of Student',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _studentnameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }else if (value.length != 11) {
                                  return 'Please enter a valid enrollment no.';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              maxLength: 11,
                              decoration: InputDecoration(
                                hintText: '79879667878',
                                counterText: '',
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Name of the organization  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Name of the organization',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'NGO',
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Role in the organization  ' ,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  // TextSpan(
                                  //   text: '*',
                                  //   style: TextStyle(
                                  //     color: Colors.red,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Text('Role in the organization',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _rollController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Member',
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Event name  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Event name',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _eventNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Abc',
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Details about event organized  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Details about event organized',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Event held from  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Event held from',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Event held to  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Event held to',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Duration of Event  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Duration of Event',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _durationController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: '2 Days',
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Address of the Place where event held  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Address of the Place where event held',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _addressController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
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
                              style: TextStyle(color: Colors.white),),
                            // SizedBox(
                            //   height: 20,
                            // ),
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
                            _showWorkshopOrganizedTextField = false;
                          });
                        },
                        icon: Icon(
                          _showConferenceOrganizedTextField ? Icons.remove : Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: Text(
                          _showConferenceOrganizedTextField ? 'Event Participation' : 'Event Participation',
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
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Enrollment number of Student  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Enrollment number of Student',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _student2nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }else if (value.length != 11) {
                                  return 'Please enter a valid enrollment no.';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              maxLength: 11,
                              decoration: InputDecoration(
                                hintText: '79879667878',
                                counterText: '',
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Name of the Organization  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Name of the Organization',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _name2Controller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'NGO',
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Role in the organization  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  // TextSpan(
                                  //   text: '*',
                                  //   style: TextStyle(
                                  //     color: Colors.red,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Text('Role in the organization',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _roll2Controller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Member',
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Event name  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Event name',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _eventName2Controller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Abc',
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Details about participation in event in brief  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Details about participation in event in brief',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Event held from  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Event held from',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
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
                                  onPressed: () => _conferenceOrganizedHeldFromDate(context),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Event held to  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Event held to',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Duration of Event  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Duration of Event',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _duration2Controller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: '2 Days',
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Individual/Group  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Individual/Group',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _indiOrGroupController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Individual',
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Achievements(if any)  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Achievements(if any)',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _achievementsController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Na',
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

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Address of the Place where event held  ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text('Address of the Place where event held',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _address2Controller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
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
                              style: TextStyle(color: Colors.white),),
                            SizedBox(
                              height: 20,
                            ),
                            // Add more text fields as needed
                          ],
                        ),),
                    ],


                  ],
                ),
              ),
          ElevatedButton(
                onPressed: () {
                  if(_showWorkshopOrganizedTextField) {
                    if (_nameController.text.isEmpty ||
                        _eventNameController.text.isEmpty ||
                        _detailsController.text.isEmpty ||
                        _durationController.text.isEmpty ||
                        _addressController.text.isEmpty ||
                        _studentnameController.text.isEmpty) {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        title: 'Oops...',
                        text: 'Please fill in all the required fields in Event Organized.',
                      );
                    } else if(_studentnameController.text.length != 11){
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.warning,
                        text: 'Please enter a valid Enrollment No. in Event Organized.',
                      );
                    }else {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => CommunityServiceScreen(),
                      //   ),
                      // );
                      Navigator.pop(context);
                      _saveStudentResultData();
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'Saved Successfully!',
                      );
                    }
                  }
                  if(_showConferenceOrganizedTextField) {
                    if (_name2Controller.text.isEmpty ||
                        _eventName2Controller.text.isEmpty ||
                        _details2Controller.text.isEmpty ||
                        _duration2Controller.text.isEmpty ||
                        _indiOrGroupController.text.isEmpty ||
                        _achievementsController.text.isEmpty ||
                        _address2Controller.text.isEmpty ||
                        _student2nameController.text.isEmpty) {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        title: 'Oops...',
                        text: 'Please fill in all the required fields in Event Participation.',
                      );
                    } else if(_student2nameController.text.length != 11){
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.warning,
                        text: 'Please enter a valid Enrollment No. in Event Participation.',
                      );
                    }else {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => CommunityServiceScreen(),
                      //   ),
                      // );
                      Navigator.pop(context);
                      _saveStudent2ResultData();
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'Saved Successfully!',
                      );
                    }
                  }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => CommunityServiceScreen()),
                  // );
                  // _saveTeacherData();
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
