import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:majorproject/teacher_data_sheet_screen.dart';
// import 'package:majorproject/teacher_main_screen.dart';
// import 'package:majorproject/student_data_sheet_screen.dart';
import 'package:quickalert/quickalert.dart';

class TrainingScreen extends StatefulWidget {
  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  final DatabaseReference _studentTran =
  FirebaseDatabase.instance.ref().child('StudentData').child('Academic').child('studenttraining');
  String selectedButton = '';
  DateTime durationFromDate = DateTime.now();
  DateTime durationToDate = DateTime.now();
  String _storedNickname = '';
  String selectedYearofAdmission ='';
  List<String> years = List.generate(4, (index) => (1 + index).toString());
  String? _selectedTrainingMode;

  Future<void> _selectDurationFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: durationFromDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != durationFromDate){
      setState(() {
        durationFromDate = picked;
      });
    }
  }

  Future<void> _saveInternStudentData() async {
    String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(durationFromDate);
    String formattedJoiningDate = DateFormat('yyyy-MM-dd').format(durationToDate);
    try {
      await _studentTran.child('id').child(_studentnameController.text).set({
        'enrollmentNumber': _studentnameController.text,
        'training' : _projectTitleController.text,
        'durationOfIntern' : _totalDurationController.text,
        'StartingDate' : formattedSelectedDate,
        'EndingDate' : formattedJoiningDate,
        'platformUse' : _platformUsedController.text,
        'research' : _researchApplicationController.text,
        'guide' : _guideNameController.text,
        'designation' : _guideDesignationController.text,
        'nameOfCompany' : _companyNameController.text,
        'companyAddress' : _companyAddressController.text,
        'sector' : _sectorController.text,
        'scale' : _scaleController.text,
        'incorporation' : _incorporationStatusController.text,
        'productService' : _productServiceController.text,
        'mode' : _trainingModeController.text,
        'website' : _companyLinkController.text,
        'stipend' : _stipendAmountController.text,

      });

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }

  Future <void> _selectdurationToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: durationToDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != durationToDate) {
      setState(() {
        durationToDate = picked;
      });
    }
  }
  void retrieveNickname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final storedNickname = prefs.getString('nickname') ?? ''; // Default value if not found
    setState(() {
      _storedNickname = storedNickname;
      // _nicknameController.text = storedNickname;
    });
  }

  void showYearPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 200,
          child: ListWheelScrollView(
            itemExtent: 40,
            children: years.map((String year) {
              return ListTile(
                title: Center(
                  child: Text(
                    year,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedYearofAdmission = year;
                    _yearController.text = selectedYearofAdmission; // Set the text in the controller
                  });
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
  @override
  void initState() {
    super.initState();
    retrieveNickname();
  }


  TextEditingController _yearController = TextEditingController();
  final TextEditingController _projectTitleController = TextEditingController();
  final TextEditingController _teamSizeController = TextEditingController();
  final TextEditingController _totalDurationController = TextEditingController();
  final TextEditingController _platformUsedController = TextEditingController();
  final TextEditingController _researchApplicationController = TextEditingController();
  final TextEditingController _guideNameController = TextEditingController();
  final TextEditingController _guideDesignationController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _companyAddressController = TextEditingController();
  final TextEditingController _sectorController = TextEditingController();
  final TextEditingController _scaleController = TextEditingController();
  final TextEditingController _incorporationStatusController = TextEditingController();
  final TextEditingController _productServiceController = TextEditingController();
  final TextEditingController _trainingModeController = TextEditingController();
  final TextEditingController _companyLinkController = TextEditingController();
  final TextEditingController _stipendAmountController = TextEditingController();
  final TextEditingController _studentnameController = TextEditingController();

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
              width: MediaQuery.sizeOf(context)
                  .width, // Adjust the height as needed
            ),
          ),
          Form(
            // key: formKey,
            child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height*0.085,
                  ),
                  Text(
                    'Internship/Training Details',
                    style: GoogleFonts.kufam(
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.sizeOf(context).width*0.06,
                        color: Color(0xff0CECDA)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Text('$_storedNickname',style: TextStyle(color: Colors.white),),
                  Expanded(
                    child: ListView(children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text:'Enrollment number of Student  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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

                            // Text('Enrollment number of Student  ',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            //training title
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _studentnameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter an enrollment number';
                                }
                                if (value.length != 11) {
                                  return 'Enrollment number must be exactly 11 digits';
                                }
                                return null; // Return null if the input is valid
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
                                  TextSpan(text:'Training/Project Title  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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
                            // Text('Training/Project Title',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _projectTitleController,
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

                            //team size
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text:'Team Size  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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

                            // Text('Team Size',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _teamSizeController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              maxLength: 2,
                              decoration: InputDecoration(
                                hintText: '2',
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

                            //Duration
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text:'Duration of Internship/Course(in months)  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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
                            // Text('Duration of Internship/Course(in months)',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _totalDurationController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*$'),
                                ),
                              ],
                              maxLength: 3,
                              decoration: InputDecoration(
                                hintText: '2',
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

                            //Duration From Date
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text:'Duration from date  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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
                            // Text('Duration from date',
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
                                    onTap: () => _selectDurationFromDate(context),
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
                                      text: "${durationFromDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () => _selectDurationFromDate(context),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            //duration To Date
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text:'To Date  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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
                            // Text('To Date',
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
                                    onTap: () => _selectdurationToDate(context),
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
                                      text: "${durationToDate.toLocal()}".split(' ')[0],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () =>
                                      _selectdurationToDate(context),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            //Platform/Technology Used
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text:'Platform/Technology Used  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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

                            // Text('Platform/Technology Used',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _platformUsedController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'React',
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

                            //Research/Application based
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Research/Application based  ',
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
                            // Text('Research/Application based',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _researchApplicationController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Application',
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

                            Row(
                              children: [
                                Text('Guide/Mentor Name  ',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text(
                                  '*', // Red star indicating mandatory field
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            // Text('Guide/Mentor Name',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _guideNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Mr. Abc',
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


                            Row(
                              children: [
                                Text('Designation of Guide/Mentor  ',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text(
                                  '*', // Red star indicating mandatory field
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            // Text('Designation of Guide/Mentor',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _guideDesignationController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Project Manager',
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

                            //name of company
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: 'Name of the Company/Course/Organization/University/Any other  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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
                            // Text('Name of the Company/Course/Organization/University/Any other',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _companyNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Abc Company',
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

                            //company address
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: 'Company Address/University Address (Place/Location)  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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
                            // Text('Company Address/University Address (Place/Location)',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _companyAddressController,
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
                                  TextSpan(text:'Sector  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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
                            // Text('Sector',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _sectorController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Private',
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
                                  TextSpan(text:'Scale  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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
                            // Text('Scale',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _scaleController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Small Scale',
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
                                  TextSpan(text:'Incorporation Status  ',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
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
                            // Text('Incorporation Status',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _incorporationStatusController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Private Limited Company',
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
                                  TextSpan(text:'Products/Service based(In which company deals)  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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
                            // Text('Products/Service based(In which company deals)',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _productServiceController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Service based',
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
                                  TextSpan(text:'Mode of Training  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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
                            // Text('Mode of Training',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            // TextFormField(
                            //   controller: _trainingModeController,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return 'This field is required';
                            //     }
                            //     return null;
                            //   },
                            DropdownButtonFormField<String>(
                              value: _selectedTrainingMode,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedTrainingMode = newValue;
                                  _trainingModeController.text = newValue ?? '';
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              items: <String>['Online', 'Offline', 'Hybrid'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                    style: TextStyle(
                                      color: _selectedTrainingMode == value ? Colors.white : Colors.black,
                                    ),),

                                );
                              }).toList(),
                              decoration: InputDecoration(
                                hintText: 'Online',
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
                              dropdownColor: Colors.grey,),
                            SizedBox(
                              height: 20,
                            ),

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text:'Company Website Link/Course Link  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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
                            // Text('Company Website Link/Course Link',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _companyLinkController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'abc',
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
                                  TextSpan(text:'Stipend Amount  ',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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
                            // Text('Stipend Amount',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: _stipendAmountController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'NA if unpaid',
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

                            ElevatedButton(
                              onPressed: () {

                                    if (_studentnameController.text.isEmpty ||
                                    // _yearController.text.isEmpty ||
                                    _projectTitleController.text.isEmpty ||
                                    _teamSizeController.text.isEmpty ||
                                    _totalDurationController.text.isEmpty ||
                                    _platformUsedController.text.isEmpty ||
                                    _researchApplicationController.text.isEmpty ||
                                    _guideNameController.text.isEmpty ||
                                    _guideDesignationController.text.isEmpty ||
                                    _companyNameController.text.isEmpty ||
                                    _companyAddressController.text.isEmpty ||
                                    _sectorController.text.isEmpty ||
                                    _scaleController.text.isEmpty ||
                                    _incorporationStatusController.text.isEmpty ||
                                    _productServiceController.text.isEmpty ||
                                    _trainingModeController.text.isEmpty ||
                                    _companyLinkController.text.isEmpty ||
                                    _stipendAmountController.text.isEmpty) {
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.error,
                                    title: 'Oops...',
                                    text: 'Please fill in all the required fields.',
                                  );
                                }else if(_studentnameController.text.length != 11) {
                                      QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.warning,
                                        text: 'Please enter a valid Enrollment No.',
                                      );
                                    }
                                    else {
                                  _saveInternStudentData();
                                  Navigator.pop(context);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => TrainingScreen()),
                                  // );
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    text: 'Saved Successfully!',
                                  );
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
                                style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                    ),
                  ),
                ]),
          ),

        ],
      ),
    );

  }
}


