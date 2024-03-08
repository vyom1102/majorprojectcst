import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/main.dart';
// import 'package:majorproject/teacher_data_sheet_screen.dart';
// import 'package:majorproject/teacher_main_screen.dart';
// import 'package:majorproject/student_data_sheet_screen.dart';


class HigherStudiesScreen extends StatefulWidget {
  @override
  _HigherStudiesScreenState  createState() => _HigherStudiesScreenState ();
}

class _HigherStudiesScreenState  extends State<HigherStudiesScreen> {
  final DatabaseReference _studentHigher =
  FirebaseDatabase.instance.ref().child('StudentData').child('Academic').child('studentHigherStudies');

  String selectedButton = '';
  String _selectedImage='';
  DateTime selectedDate = DateTime.now();
  DateTime joiningDate = DateTime.now();

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
      await _studentHigher.child('id').child(_studentnameController.text).set({
        'enrollmentNumber': _studentnameController.text,
        'nameOfCourse' : _courseNameController.text,
        'university' : _universityController.text,
        'location' : _locationController.text,
        'duration' : _durationController.text,
        'ppoInfo' : _ppoController.text,
        'ppoDetail' : _ppoDetailsController.text,
        'StartingDate' : selectedDate.toString(),
        'EndingDate' : joiningDate.toString(),
      });

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }


  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _ppoController = TextEditingController();
  final TextEditingController _ppoDetailsController = TextEditingController();
  final TextEditingController _studentnameController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

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
                      'Higher Studies',
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
                              Text('Enrollment number of Student',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _studentnameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'ABC',
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
                              Text('Name of the Course (Higher Studies)',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
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
                                  hintText: 'Mtech',
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

                              Text('University',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _universityController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'MAIT',
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

                              Text('Place/Location',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _locationController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Delhi',
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

                              Text('Proof of Higher Studies(Copy of Id Card/ Admission Letter',
                                style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
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

                              Text('Starting Date of Course',
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

                              Text('Completion Date of Course',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Expanded(
                                    child:
                                    TextFormField(
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

                              Text('Duration of Course',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
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
                                  hintText: '2 Year',
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

                              Text('Have you got PPO through internship',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _ppoController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Yes',
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
                                height: 20,),

                              Text('If PPO through internship give details (Name of the company and CTC)',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _ppoDetailsController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'abc , 15lpa',
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
                                height: 20,),

                              ElevatedButton(
                                onPressed: () {
                                  if (_studentnameController.text != null) {
                                    _studentHigherDetail();
                                    // If all fields are valid, navigate to the next screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => HigherStudiesScreen()),
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
                      ],),),
                  ]),
            ),]
      ),);
  }
}

