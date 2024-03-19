import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final DatabaseReference _studentCourse =
  FirebaseDatabase.instance.ref().child('StudentData').child('Academic').child('studentCourse');

  String selectedButton = '';
  String _selectedImage='';
  DateTime selectedDate = DateTime.now();
  DateTime joiningDate = DateTime.now();
  String? _selectedTrainingMode;

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
  Future<void> _studentHigherDetail() async {
    try {
      await _studentCourse.child('id').child(_studentnameController.text).set({
        'enrollmentNumber': _studentnameController.text,
        'certificate' : _imageController.text,
        'courseName' : _courseNameController.text,
        'instructorName' : _instructorOrOrganizationController.text,
        'specialization' : _specializationController.text,
        'duration' : _durationController.text,
        'onlineoffline' : _onlineController.text,
        'courseLearning' : _courseLearningController.text,
      });

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }

  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _instructorOrOrganizationController = TextEditingController();
  final TextEditingController _specializationController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _onlineController = TextEditingController();
  final TextEditingController _courseLearningController = TextEditingController();
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
                width: MediaQuery.of(context).size.width,
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
                      'Courses',
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
                                      text: 'Course Name  ',
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
                              // Text('Course Name',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _courseNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Abc',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff535353)),
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

                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Instructor Name/Organization  ',
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
                              // Text('Instructor Name/Organization',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                  controller: _instructorOrOrganizationController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Abc ',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff535353)),
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

                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Specialization  ',
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
                              // Text('Specialization',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _specializationController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Abc ',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff535353)),
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

                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Duration of course (in months)  ',
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
                              // Text('Duration of course (in months)',
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
                                    borderSide: BorderSide(color: Color(0xff535353)),
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

                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Course started from  ',
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
                              // Text('Course started from',
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
                                      text: 'Course ended on  ',
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
                              // Text('Course ended on',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              // SizedBox(height: 5),
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
                                    onPressed: () =>
                                        _joiningDate(context),
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
                                      text: 'Online/Offline  ',
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
                              // Text('Online/Offline',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              // TextFormField(
                              //   controller: _onlineController,
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
                                    _onlineController.text = newValue ?? '';
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                items: <String>['Online', 'Offline'].map((String value) {
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
                                    borderSide: BorderSide(color: Color(0xff535353)),
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
                                    TextSpan(
                                      text: 'Course learning outcome  ',
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
                              // Text('Course learning outcome',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _courseLearningController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Abc',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff535353)),
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


                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Upload certificate(Google drive link)  ',
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
                              // Text('Upload certificate',
                              //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,
                              //       fontSize: 14,color: Colors.white),),
                              // SizedBox(height: 5),
                              // Text('Course learning outcome',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _imageController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Abc',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff535353)),
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
                              // Padding(
                              //   padding: const EdgeInsets.all(0.0),
                              //   child:
                              //   Column(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children:[
                              //         Stack(
                              //             children:[
                              //               TextField(
                              //               controller: _imageController,
                              //               readOnly: true,
                              //               decoration: InputDecoration(
                              //                 hintText: 'Browse',
                              //                 suffixIcon: IconButton(
                              //                   icon: Icon(Icons.add, size: 25.0,),
                              //                   onPressed: () {
                              //                     _pickImage();
                              //                   },),
                              //                 enabledBorder: OutlineInputBorder(
                              //                   borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                              //                 ),
                              //                 focusedBorder: OutlineInputBorder(
                              //                   borderSide: BorderSide(color: Color(0xff0CECDA)),
                              //                 ),
                              //                 hintStyle: GoogleFonts.kufam(
                              //                     color: Colors.white.withOpacity(0.5)),
                              //                 contentPadding: const EdgeInsets.symmetric(
                              //                     vertical: 20.0, horizontal: 15.0),
                              //                 border: OutlineInputBorder(),
                              //                 fillColor: Color(0xff141318),
                              //                 filled: true,
                              //               ),
                              //               style: TextStyle(color: Colors.white),
                              //
                              //             ),
                              //             ]
                              //           //     if (_selectedImage != null)
                              //           // Image.file(
                              //           //   File(_selectedImage),
                              //           //   height: 100,
                              //           //   width: 100,
                              //         ),]
                              //   ),
                              // ),
                              SizedBox(height: 20),

                              ElevatedButton(
                                onPressed: () {
                                  if (_imageController.text.isEmpty ||
                                      _courseNameController.text.isEmpty ||
                                      _instructorOrOrganizationController.text.isEmpty ||
                                      _specializationController.text.isEmpty ||
                                      _durationController.text.isEmpty ||
                                      _onlineController.text.isEmpty ||
                                      _courseLearningController.text.isEmpty ||
                                      _studentnameController.text.isEmpty) {
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.error,
                                      title: 'Oops...',
                                      text: 'Please fill in all the required fields.',
                                    );
                                  } else if(_studentnameController.text.length != 11) {
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.warning,
                                      text: 'Please enter a valid Enrollment No.',
                                    );
                                  }else {
                                    _studentHigherDetail();
                                    Navigator.pop(context);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => CoursesScreen()),
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
                      ],),
                    ),
                  ]),
            ),
          ]
      ),
    );
  }
}


