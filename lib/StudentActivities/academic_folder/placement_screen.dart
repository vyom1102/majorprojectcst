import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/main.dart';
// import 'package:majorproject/teacher_data_sheet_screen.dart';
// import 'package:majorproject/teacher_main_screen.dart';
// import 'package:majorproject/student_data_sheet_screen.dart';
import 'package:quickalert/quickalert.dart';

class PlacementScreen extends StatefulWidget {
  @override
  _PlacementScreenState createState() => _PlacementScreenState();
}

class _PlacementScreenState extends State<PlacementScreen> {
  final DatabaseReference _studentPlacement =
  FirebaseDatabase.instance.ref().child('StudentData').child('Academic').child('studentPlacement');

  String selectedButton = '';
  String selectedYear ='';
  List<String> years = List.generate(25, (index) => (2000 + index).toString());
  TextEditingController _yearController = TextEditingController();

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
                    selectedYear = year;
                    _yearController.text = selectedYear; // Set the text in the controller
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
  Future<void> _studentHigherDetail() async {
    try {
      await _studentPlacement.child('id').child(_studentnameController.text).set({
        'enrollmentNumber': _studentnameController.text,
        'batch' : selectedYear.toString(),
        'placement' : _categoriesController.text,
        'campusPlacement' : _placementController.text,
        'companyName' : _companyNameController.text,
        'package' : _packageController.text,
        'position' : _positionController.text,
        'location' : _locationController.text,
      });

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }

  final TextEditingController _categoriesController = TextEditingController();
  final TextEditingController _placementController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _packageController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
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
                      'Placement',
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

                              Text('Batch',
                                style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: GestureDetector(
                                  onTap: () {
                                    showYearPicker(context);
                                  },
                                  child: AbsorbPointer(
                                    child: TextField(
                                      readOnly: true,
                                      controller: TextEditingController(text: selectedYear),
                                      decoration: InputDecoration(
                                        hintText: 'Select',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                                        ),
                                        suffixIcon: Icon(Icons.arrow_drop_down,
                                          size: 40.0,),
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
                                  ),
                                ),),
                              SizedBox(
                                height: 20,
                              ),

                              Text('Placement/Startup/Entreprenuer',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _categoriesController,
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

                              Text('Campus Placement/Off Campus Placement',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _placementController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Campus Placement',
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

                              Text('Company Name',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
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

                              Text('Package (CTC)',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _packageController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: '15lpa',
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

                              Text('Position',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: _positionController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Software Developer Engineer',
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

                              Text('Current Location',
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

                              ElevatedButton(
                                onPressed: () {
                                  if (_categoriesController.text.isEmpty ||
                                      _placementController.text.isEmpty ||
                                      _companyNameController.text.isEmpty ||
                                      _packageController.text.isEmpty ||
                                      _positionController.text.isEmpty ||
                                      _locationController.text.isEmpty ||
                                      _studentnameController.text.isEmpty) {
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.error,
                                      title: 'Oops...',
                                      text: 'Please fill in all the required fields.',
                                    );
                                  } else {
                                    _studentHigherDetail();
                                    Navigator.pop(context);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => PlacementScreen()),
                                    // );
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

