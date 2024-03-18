import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/main.dart';
import 'package:quickalert/quickalert.dart';


class CompetitionScreen extends StatefulWidget {
  @override
  _CompetitionScreenState createState() => _CompetitionScreenState();
}

class _CompetitionScreenState extends State<CompetitionScreen> {
  final DatabaseReference _studentCompi =
  FirebaseDatabase.instance.ref().child('StudentData').child('Academic').child('studentcompetition');

  String selectedButton = '';
  String _selectedImage='';
  DateTime selectedDate = DateTime.now();
  DateTime joiningDate = DateTime.now();

  TextEditingController _imageController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile.path;
        _imageController.text = _selectedImage;
      });
    }
  }

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
  Future<void> _saveCompiStudentData() async {
    try {
      String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      await _studentCompi.child('id').child(_enrollmentController.text).set({
        'projectID' : _projectIDController.text,
        'branch' : _branchController.text,
        'projectGuide' : _guideController.text,
        'projectCoGuide' : _coGuideController.text,
        'projectTitle' : _titleController.text,
        'projectDomain' : _domainController.text,
        'member1Name' : _memberNameController.text,
        'member1Enroll' : _enrollmentController.text,
        'member1Email' : _emailController.text,
        'member1WhatsappNumber' : _whatsappNumberController.text,
        'member1Group' : _groupController.text,
        'member2Name' : _memberName2Controller.text,
        'member2Enroll' : _enrollment2Controller.text,
        'member2Email' : _email2Controller.text,
        'member2WhatsappNumber' : _whatsappNumber2Controller.text,
        'member2Group' : _group2Controller.text,
        'member3Name' : _memberName3Controller.text,
        'member3Enroll' : _enrollment3Controller.text,
        'member3Email' : _email3Controller.text,
        'member3WhatsappNumber' : _whatsappNumber3Controller.text,
        'member3Group' : _group3Controller.text,
        'member4Name' : _memberName4Controller.text,
        'member4Enroll' : _enrollment4Controller.text,
        'member4Email' : _email4Controller.text,
        'member4WhatsappNumber' : _whatsappNumber4Controller.text,
        'member4Group' : _group4Controller.text,
        'member5Name' : _memberName5Controller.text,
        'member5Enroll' : _enrollment5Controller.text,
        'member5Email' : _email5Controller.text,
        'member5WhatsappNumber' : _whatsappNumber5Controller.text,
        'member5Group' : _group5Controller.text,
        'HardwareSoftwareProject' : _hardwareSoftwareController.text,
        'otherMember' : _otherMemberController.text,
        'projectProblem' : _participationController.text,
        'nameNationInternationalCompetition' : _nameOfCompController.text,
        'dateOfParticipation' :formattedSelectedDate,
        'proofUpload' : _imageController.text,
      });

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }

  final TextEditingController _projectIDController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _guideController = TextEditingController();
  final TextEditingController _coGuideController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _domainController = TextEditingController();

  final TextEditingController _memberNameController = TextEditingController();
  final TextEditingController _enrollmentController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _whatsappNumberController = TextEditingController();
  final TextEditingController _groupController = TextEditingController();

  final TextEditingController _memberName2Controller = TextEditingController();
  final TextEditingController _enrollment2Controller = TextEditingController();
  final TextEditingController _email2Controller = TextEditingController();
  final TextEditingController _whatsappNumber2Controller = TextEditingController();
  final TextEditingController _group2Controller = TextEditingController();

  final TextEditingController _memberName3Controller = TextEditingController();
  final TextEditingController _enrollment3Controller = TextEditingController();
  final TextEditingController _email3Controller = TextEditingController();
  final TextEditingController _whatsappNumber3Controller = TextEditingController();
  final TextEditingController _group3Controller = TextEditingController();

  final TextEditingController _memberName4Controller = TextEditingController();
  final TextEditingController _enrollment4Controller = TextEditingController();
  final TextEditingController _email4Controller = TextEditingController();
  final TextEditingController _whatsappNumber4Controller = TextEditingController();
  final TextEditingController _group4Controller = TextEditingController();

  final TextEditingController _memberName5Controller = TextEditingController();
  final TextEditingController _enrollment5Controller = TextEditingController();
  final TextEditingController _email5Controller = TextEditingController();
  final TextEditingController _whatsappNumber5Controller = TextEditingController();
  final TextEditingController _group5Controller = TextEditingController();

  final TextEditingController _hardwareSoftwareController = TextEditingController();
  final TextEditingController _otherMemberController = TextEditingController();
  final TextEditingController _participationController = TextEditingController();
  final TextEditingController _nameOfCompController = TextEditingController();
  //final TextEditingController _studentnameController = TextEditingController();

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
                width: MediaQuery.sizeOf(context)
                    .width, // Adjust the height as needed
              ),
            ),
            Form(
              // key: formKey,
              child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      'Competition',
                      style: GoogleFonts.kufam(
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                          color: Color(0xff0CECDA)),
                    ),

                    Expanded(
                      child: ListView(children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text('Enrollment number of Student',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              // SizedBox(height: 5),
                              // TextFormField(
                              //   controller: _studentnameController,
                              //   validator: (value) {
                              //     if (value == null || value.isEmpty) {
                              //       return 'This field is required';
                              //     }
                              //     return null;
                              //   },
                              //   decoration: InputDecoration(
                              //     hintText: 'ABC',
                              //     enabledBorder: OutlineInputBorder(
                              //       borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                              //     ),
                              //     focusedBorder: OutlineInputBorder(
                              //       borderSide: BorderSide(color: Color(0xff0CECDA)),
                              //     ),
                              //     hintStyle: GoogleFonts.kufam(
                              //         color: Colors.white.withOpacity(0.5)),
                              //     contentPadding: const EdgeInsets.symmetric(
                              //         vertical: 20.0, horizontal: 15.0),
                              //     border: OutlineInputBorder(),
                              //     fillColor: Color(0xff141318),
                              //     filled: true,
                              //   ),
                              //   style: TextStyle(color: Colors.white),),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              //Project ID

                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Project ID  ',
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
                              // Text('Project ID',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _projectIDController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: '61',
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

                              //Branch
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Branch  ',
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
                              // Text('Branch',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _branchController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'CSE',
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

                              //Prospective Project Guide
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Prospective Project Guide  ',
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
                              // Text('Prospective Project Guide',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _guideController,
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

                              //Prospective Project Co-Guide Manager
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Prospective Project Co-Guide  ',
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
                              // Text('Prospective Project Co-Guide',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _coGuideController,
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

                              //Project Title
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Project Title  ',
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
                              // Text('Project Title',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _titleController,
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

                              //Project's Domain
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Project\'s Domain  ' ,
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
                              // Text('Project\'s Domain',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _domainController,
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

                              //member 1 name
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 1 Name  ',
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
                              // Text('Member 1 Name',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _memberNameController,
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

                              //member 1 enroll
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 1 Enrollment no.  ',
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
                              // Text('Member 1 Enrollment no.',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _enrollmentController,
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
                                maxLength: 11,
                                decoration: InputDecoration(
                                  hintText: '08796875620',
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

                              //member 1 email
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 1 Email  ',
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
                              // Text('Member 1 Email',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'abc@gmail.com',
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

                              //member 1 whatsapp no.
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 1 Whatsapp No.  ',
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
                              // Text('Member 1 Whatsapp No.',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _whatsappNumberController,
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
                                maxLength: 10,
                                decoration: InputDecoration(
                                  hintText: '97688XXXXX',
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

                              //member 1 group name
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 1 Group  ',
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
                              // Text('Member 1 Group',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _groupController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'C1',
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

                              //member 2 name
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 2 Name',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 2 Name',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _memberName2Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
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

                              //member 2 enroll
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 2 Enrollment no.',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 2 Enrollment no.',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _enrollment2Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 11,
                                decoration: InputDecoration(
                                  hintText: '08796875620',
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

                              //member 2 email
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 2 Email',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 2 Email',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _email2Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                decoration: InputDecoration(
                                  hintText: 'abc@gmail.com',
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

                              //member 2 whatsapp no.
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 2 Whatsapp No.',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 2 Whatsapp No.',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _whatsappNumber2Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 10,
                                decoration: InputDecoration(
                                  hintText: '97688XXXXX',
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

                              //member 2 group name
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 2 Group',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 2 Group',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _group2Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                decoration: InputDecoration(
                                  hintText: 'C1',
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

                              //member 3 name
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 3 Name',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 3 Name',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _memberName3Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
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

                              //member 3 enroll
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 3 Enrollment no.',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 3 Enrollment no.',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _enrollment3Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 11,
                                decoration: InputDecoration(
                                  hintText: '08796875620',
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

                              //member 3 email
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 3 Email',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 3 Email',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _email3Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                decoration: InputDecoration(
                                  hintText: 'abc@gmail.com',
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

                              //member 3 whatsapp no.
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 3 Whatsapp No.',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 3 Whatsapp No.',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _whatsappNumber3Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 10,
                                decoration: InputDecoration(
                                  hintText: '97688XXXXX',
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

                              //member 3 group name
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 3 Group',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 3 Group',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _group3Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                decoration: InputDecoration(
                                  hintText: 'C1',
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

                              //member 4 name
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 4 Name',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 4 Name',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _memberName4Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
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

                              //member 4 enroll
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 4 Enrollment no.',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 4 Enrollment no.',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _enrollment4Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 11,
                                decoration: InputDecoration(
                                  hintText: '08796875620',
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

                              //member 4 email
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 4 Email',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 4 Email',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _email4Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                decoration: InputDecoration(
                                  hintText: 'abc@gmail.com',
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

                              //member 4 whatsapp no.
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 4 Whatsapp No.',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 4 Whatsapp No.',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _whatsappNumber4Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 10,
                                decoration: InputDecoration(
                                  hintText: '97688XXXXX',
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

                              //member 4 group name
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 4 Group',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 4 Group',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _group4Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                decoration: InputDecoration(
                                  hintText: 'C1',
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

                              //member 5 name
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 5 Name',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 5 Name',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _memberName5Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
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

                              //member 5 enroll
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 5 Enrollment no.',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 5 Enrollment no.',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _enrollment5Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 11,
                                decoration: InputDecoration(
                                  hintText: '08796875620',
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

                              //member 5 email
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 5 Email',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 5 Email',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _email5Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                decoration: InputDecoration(
                                  hintText: 'abc@gmail.com',
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

                              //member 5 whatsapp no.
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 5 Whatsapp No.',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 5 Whatsapp No.',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _whatsappNumber5Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 10,
                                decoration: InputDecoration(
                                  hintText: '97688XXXXX',
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

                              //member 5 group name
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Member 5 Group  ',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text('Member 5 Group',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _group5Controller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
                                decoration: InputDecoration(
                                  hintText: 'C1',
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

                              //Software based Project
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Hardware/Software based Project  ',
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
                              // Text('Hardware/Software based Project',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _hardwareSoftwareController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Software based Project',
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

                              //Software based Project
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Other members(junior/other department) only for hardware projects  ',
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
                              // Text('Other members(junior/other department) only for hardware projects',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _otherMemberController,
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
                                      text:'Have you participated in any national or international competition for this project problem?  ',
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
                              // Text('Have you participated in any national or international competition for this project problem?',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _participationController,
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
                                      text:'Name of national or international competition  ',
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
                              // Text('Name of national or international competition',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _nameOfCompController,
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

                              //Date of participation
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Date of participation  ',
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
                              // Text('Date of participation',
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

                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'Upload proof of participation  ',
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
                              // Text('Upload proof of participation',
                              //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child:
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Stack(
                                          children:[ TextField(
                                            controller: _imageController,
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              hintText: 'Browse',
                                              suffixIcon: IconButton(
                                                icon: Icon(Icons.add, size: 25.0,),
                                                onPressed: () {
                                                  _pickImage();
                                                },),
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
                                          ]
                                        //     if (_selectedImage != null)
                                        // Image.file(
                                        //   File(_selectedImage),
                                        //   height: 100,
                                        //   width: 100,

                                      ),]
                                ),
                              ),
                              SizedBox(height: 20),

                              ElevatedButton(
                                onPressed: () {
                                    if (_projectIDController.text.isEmpty ||
                                    _branchController.text.isEmpty ||
                                    _guideController.text.isEmpty ||
                                    _coGuideController.text.isEmpty ||
                                    _titleController.text.isEmpty ||
                                    _domainController.text.isEmpty ||
                                    _memberNameController.text.isEmpty ||
                                    _enrollmentController.text.isEmpty ||
                                    _emailController.text.isEmpty ||
                                    _whatsappNumberController.text.isEmpty ||
                                    _groupController.text.isEmpty ||
                                    _hardwareSoftwareController.text.isEmpty ||
                                    _otherMemberController.text.isEmpty ||
                                    _participationController.text.isEmpty ||
                                    _nameOfCompController.text.isEmpty)
                                    {
                                    QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.error,
                                    title: 'Oops...',
                                    text: 'Please fill in all the required fields.',);}
                                    else {
                                    _saveCompiStudentData();
                                  Navigator.pop(context);}
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
                      ],),),
                  ]),
            ),]
      ),);
  }
}
