import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Add form key

  String selectedButton = '';
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
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                  children: [
                    SizedBox(
                      height: 70,
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
                              Text('Name of the Faculty Member',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Shreya',
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
                              Text('Details of the Seminar Attennded',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
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
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // If all fields are valid, navigate to the next screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CoursesScreen()),
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
                                  'Next',
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


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:majorproject/academic_activity_screen.dart';
// import 'package:majorproject/main.dart';
// // import 'package:majorproject/teacher_data_sheet_screen.dart';
// // import 'package:majorproject/teacher_main_screen.dart';
// // import 'package:majorproject/student_data_sheet_screen.dart';
//
// class CoursesScreen extends StatefulWidget {
//   @override
//   _CoursesScreenState createState() => _CoursesScreenState();
// }
//
// class _CoursesScreenState extends State<CoursesScreen> {
//   String selectedButton = '';
//   DateTime selectedDate = DateTime.now();
//   DateTime joiningDate = DateTime.now();
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
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       backgroundColor: Color(0xff141318),
//       body: Stack(
//           children: [
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Image.asset(
//                 'images/bottom_container.png',
//                 fit: BoxFit.cover,
//                 height: 200,
//                 width: MediaQuery.sizeOf(context)
//                     .width, // Adjust the height as needed
//               ),
//             ),
//             Form(
//                 key: _formKey,
//               child: Column(
//                   children: [
//                     SizedBox(
//                       height: 70,
//                     ),
//                     Text(
//                       'Courses',
//                       style: GoogleFonts.kufam(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 26,
//                           color: Color(0xff0CECDA)),
//                     ),
//
//                     Expanded(
//                       child: ListView(children: [
//                         Container(
//                           padding: EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Name of the Faculty Member',
//                                   style: TextStyle(
//                                       fontSize: 14.0,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white)),
//                               SizedBox(height: 5),
//                               TextFormField(
//                                 // controller: _fullNameController,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'This field is required';
//                                   }
//                                   return null;
//                                 },
//                                 decoration: InputDecoration(
//                                   hintText: 'Shreya',
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                   ),
//                                   hintStyle: GoogleFonts.kufam(
//                                       color: Colors.white.withOpacity(0.5)),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       vertical: 20.0, horizontal: 15.0),
//                                   border: OutlineInputBorder(),
//                                   fillColor: Color(0xff141318),
//                                   filled: true,
//                                 ),
//                                 style: TextStyle(color: Colors.white),),
//                               SizedBox(
//                                 height: 20,
//                               ),
//
//                               Text('Details of the Seminar Attennded',
//                                   style: TextStyle(
//                                       fontSize: 14.0,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white)),
//                               SizedBox(height: 5),
//                               TextFormField(
//                                 // controller: _fullNameController,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'This field is required';
//                                   }
//                                   return null;
//                                 },
//                                 decoration: InputDecoration(
//                                   hintText: 'Abc ',
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                   ),
//                                   hintStyle: GoogleFonts.kufam(
//                                       color: Colors.white.withOpacity(0.5)),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       vertical: 20.0, horizontal: 15.0),
//                                   border: OutlineInputBorder(),
//                                   fillColor: Color(0xff141318),
//                                   filled: true,
//                                 ),
//                                 style: TextStyle(color: Colors.white),),
//                               SizedBox(
//                                 height: 20,
//                               ),
//
//                               Text('Seminar held from',
//                                   style: TextStyle(
//                                       fontSize: 14.0,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white)),
//                               SizedBox(height: 5),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: TextFormField(
//                                       readOnly: true, // Disable manual editing
//                                       onTap: () => _selectDate(context),
//                                       decoration: InputDecoration(
//                                         hintText: 'Select a date',
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                         ),
//                                         hintStyle: TextStyle(
//                                           color: Colors.white.withOpacity(0.5),
//                                         ),
//                                         contentPadding: const EdgeInsets.symmetric(
//                                           vertical: 20.0,
//                                           horizontal: 15.0,
//                                         ),
//                                         border: OutlineInputBorder(),
//                                         fillColor: Color(0xff141318),
//                                         filled: true,
//                                       ),
//                                       style: TextStyle(color: Colors.white),
//                                       controller: TextEditingController(
//                                         text: "${selectedDate.toLocal()}".split(' ')[0],
//                                       ),
//                                     ),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(Icons.calendar_today),
//                                     onPressed: () => _selectDate(context),
//                                     color: Colors.white,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//
//                               Text('Seminar held to',
//                                   style: TextStyle(
//                                       fontSize: 14.0,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white)),
//                               SizedBox(height: 5),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: TextFormField(
//                                       readOnly: true, // Disable manual editing
//                                       onTap: () => _joiningDate(context),
//                                       decoration: InputDecoration(
//                                         hintText: 'Select a date',
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                         ),
//                                         hintStyle: TextStyle(
//                                           color: Colors.white.withOpacity(0.5),
//                                         ),
//                                         contentPadding: const EdgeInsets.symmetric(
//                                           vertical: 20.0,
//                                           horizontal: 15.0,
//                                         ),
//                                         border: OutlineInputBorder(),
//                                         fillColor: Color(0xff141318),
//                                         filled: true,
//                                       ),
//                                       style: TextStyle(color: Colors.white),
//                                       controller: TextEditingController(
//                                         text: "${joiningDate.toLocal()}".split(' ')[0],
//                                       ),
//                                     ),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(Icons.calendar_today),
//                                     onPressed: () =>
//                                         _joiningDate(context),
//                                     color: Colors.white,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//
//                               Text('Duration of Seminar',
//                                   style: TextStyle(
//                                       fontSize: 14.0,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white)),
//                               SizedBox(height: 5),
//                               TextField(
//                                 // controller: _emailAddressController,
//                                 decoration: InputDecoration(
//                                   hintText: '2 months',
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                   ),
//                                   hintStyle: GoogleFonts.kufam(
//                                       color: Colors.white.withOpacity(0.5)),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       vertical: 20.0, horizontal: 15.0),
//                                   border: OutlineInputBorder(),
//                                   fillColor: Color(0xff141318),
//                                   filled: true,
//                                 ),
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//
//                               Text('Address of the Place where seminar held',
//                                   style: TextStyle(
//                                       fontSize: 14.0,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white)),
//                               SizedBox(height: 5),
//                               TextField(
//                                 // controller: _permanentAddressController,
//                                 decoration: InputDecoration(
//                                   hintText: 'Enter the Address',
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                   ),
//                                   hintStyle: GoogleFonts.kufam(
//                                       color: Colors.white.withOpacity(0.5)),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       vertical: 20.0, horizontal: 15.0),
//                                   border: OutlineInputBorder(),
//                                   fillColor: Color(0xff141318),
//                                   filled: true,
//                                 ),
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//
//                               ElevatedButton(
//                                 onPressed: () {
//                                   // Navigator.push(
//                                 //     context,
//                                 //     MaterialPageRoute(builder: (context) => CoursesScreen()),
//                                 //   );
//                                 // },
//                                   if (_formKey.currentState!.validate()) {
//                                   // If all fields are valid, navigate to the next screen
//                                   Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => CoursesScreen()),
//                                   );
//                                   },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Color(0xFF13E9DC),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20.0),
//                                   ),
//                                   minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
//                                 ),
//                                 child: Text(
//                                   'Next',
//                                   style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],),),
//                   ]),
//             ),]
//       ),);
//   }
// }
//
//
