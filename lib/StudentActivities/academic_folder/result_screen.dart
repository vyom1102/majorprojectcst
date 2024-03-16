import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/main.dart';
import 'package:quickalert/quickalert.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final DatabaseReference _studentResult =
  FirebaseDatabase.instance.ref().child('StudentData').child('Academic').child('studentResult');

  String selectedButton = '';

  final TextEditingController _sem1Controller = TextEditingController();
  final TextEditingController _sem2Controller = TextEditingController();
  final TextEditingController _sem3Controller = TextEditingController();
  final TextEditingController _sem4Controller = TextEditingController();
  final TextEditingController _sem5Controller = TextEditingController();
  final TextEditingController _sem6Controller = TextEditingController();
  final TextEditingController _sem7Controller = TextEditingController();
  final TextEditingController _sem8Controller = TextEditingController();
  final TextEditingController _overallController = TextEditingController();
  final TextEditingController _studentnameController = TextEditingController();

  // Future<void> _studentHigherDetail() async {
  //   try {
  //     await _studentResult.child('id').child(_studentnameController.text).set({
  //       'enrollmentNumber': _studentnameController.text,
  //       'sem1' : _sem1Controller.text,
  //       'sem2' : _sem2Controller.text,
  //       'sem3' : _sem3Controller.text,
  //       'sem4' : _sem4Controller.text,
  //       'sem5' : _sem5Controller.text,
  //       'sem6' : _sem6Controller.text,
  //       'sem7' : _sem7Controller.text,
  //       'sem8' : _sem8Controller.text,
  //       'overall' : _overallController.text,
  //     });
  //
  //   } catch (error) {
  //     // Handle the error
  //     print('Error saving data: $error');
  //   }
  // }

  Future<void> _studentHigherDetail() async {
    try {
      await _studentResult.child('id').child(_studentnameController.text).set({
        'enrollmentNumber': int.tryParse(_studentnameController.text) ?? 0,
        'sem1': double.tryParse(_sem1Controller.text) ?? 0,
        'sem2': double.tryParse(_sem2Controller.text) ?? 0,
        'sem3': double.tryParse(_sem3Controller.text) ?? 0,
        'sem4': double.tryParse(_sem4Controller.text) ?? 0,
        'sem5': double.tryParse(_sem5Controller.text) ?? 0,
        'sem6': double.tryParse(_sem6Controller.text) ?? 0,
        'sem7': double.tryParse(_sem7Controller.text) ?? 0,
        'sem8': double.tryParse(_sem8Controller.text) ?? 0,
        'overall': double.tryParse(_overallController.text) ?? 0,
      });
    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }


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
            Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Results',
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
                            Text('Semester 1 GPA',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _sem1Controller,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'This field is required';
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*$'),
                                ),
                              ],
                              maxLength: 4,
                              decoration: InputDecoration(
                                hintText: '9.54',
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
                            Text('Semester 2 GPA',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _sem2Controller,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'This field is required';
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*$'),
                                ),
                              ],
                              maxLength: 4,
                              decoration: InputDecoration(
                                hintText: '9.54',
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

                            // Text('Semester 3 GPA',
                            //     style: TextStyle(
                            //         fontSize: 14.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white)),
                            // SizedBox(height: 5),
                            // TextField(
                            //   controller: _sem3Controller,
                            //   // validator: (value) {
                            //   //   if (value == null || value.isEmpty) {
                            //   //     return 'This field is required';
                            //   //   }
                            //   //   return null;
                            //   // },
                            //   decoration: InputDecoration(
                            //     hintText: '9',
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
                            Text('Semester 3 GPA',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: _sem3Controller,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*$'),
                                ),
                              ],
                              maxLength: 4, // Add this line to set numeric keyboard
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'This field is required';
                              //   }
                              //   return null;
                              // },
                              decoration: InputDecoration(
                                hintText: '9.54',
                                counterText: '',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff0CECDA)),
                                ),
                                hintStyle: GoogleFonts.kufam(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                                border: OutlineInputBorder(),
                                fillColor: Color(0xff141318),
                                filled: true,
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 20,
                            ),


                            Text('Semester 4 GPA',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _sem4Controller,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'This field is required';
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*$'),
                                ),
                              ],
                              maxLength: 4,
                              decoration: InputDecoration(
                                hintText: '9.54',
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

                            Text('Semester 5 GPA',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _sem5Controller,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'This field is required';
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*$'),
                                ),
                              ],
                              maxLength: 4,
                              decoration: InputDecoration(
                                hintText: '9.54',
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

                            Text('Semester 6 GPA',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _sem6Controller,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'This field is required';
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*$'),
                                ),
                              ],
                              maxLength: 4,
                              decoration: InputDecoration(
                                hintText: '9.54',
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

                            Text('Semester 7 GPA',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _sem7Controller,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'This field is required';
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*$'),
                                ),
                              ],
                              maxLength: 4,
                              decoration: InputDecoration(
                                hintText: '9.54',
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

                            Text('Semester 8 GPA',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _sem8Controller,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'This field is required';
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*$'),
                                ),
                              ],
                              maxLength: 4,
                              decoration: InputDecoration(
                                hintText: '9.54',
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

                            Text('Overall GPA',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextField(
                              controller: _overallController,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'This field is required';
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*$'),
                                ),
                              ],
                              maxLength: 4,
                              decoration: InputDecoration(
                                hintText: '9.54',
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

                            ElevatedButton(
                              onPressed: () {
                                if (_sem1Controller.text.isEmpty ||
                                    _overallController.text.isEmpty ||
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
                ]),]
      ),);
  }
}
