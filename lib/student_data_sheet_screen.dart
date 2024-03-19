// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:majorproject/academic_activity_screen.dart';
// import 'package:majorproject/student_main_screen.dart';
// import 'package:majorproject/teacher_main_screen.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:firebase_core/firebase_core.dart';
//
//
// class studentDataSheet extends StatefulWidget {
//   @override
//   _studentDataSheetState createState() => _studentDataSheetState();
// }
//
// class _studentDataSheetState extends State<studentDataSheet> {
//
//   final DatabaseReference _studentRef =
//   FirebaseDatabase.instance.ref().child('student');
//
//   String _selectedImage='';
//   String selectedYearofAdmission ='';
//   List<String> years = List.generate(25, (index) => (2000 + index).toString());
//
//
//   PageController _pageController = PageController(initialPage: 0);
//   int _currentPage = 0;
//
//   DateTime selectedDate = DateTime.now();
//
//
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }
//
//
//   void showYearPicker(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext builder) {
//         return Container(
//           height: 200,
//           child: ListWheelScrollView(
//             itemExtent: 40,
//             children: years.map((String year) {
//               return ListTile(
//                 title: Center(
//                   child: Text(
//                     year,
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//                 onTap: () {
//                   setState(() {
//                     selectedYearofAdmission = year;
//                     _yearController.text = selectedYearofAdmission; // Set the text in the controller
//                   });
//                   Navigator.of(context).pop();
//                 },
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
//
//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = pickedFile.path;
//         _imageController.text = _selectedImage;
//       });
//     }
//   }
//
//   Future<void> _saveStudentData() async {
//     try {
//       await _studentRef.child('id').child(_rollNumberController.text).set({
//         'fullName': _fullNameController.text,
//         'emailAddress': _emailAddressController.text,
//         'rollNumber': _rollNumberController.text,
//         'dateOfBirth': selectedDate.toLocal().toString(),
//         'permanentAddress': _permanentAddressController.text,
//         'jeeRank': _jeeRankController.text,
//         'mobileNumber': _mobileNumberController.text,
//         'image': _imageController.text,
//         'year': _yearController.text,
//         'fatherName': _fatherNameController.text,
//         'fatherOccupation': _fatherOccupationController.text,
//         'fatherOfficeAddress': _fatherOfficeAddressController.text,
//         'fatherPhoneNumber': _fatherPhoneNumberController.text,
//         'motherName': _motherNameController.text,
//         'motherOccupation': _motherOccupationController.text,
//         'motherOfficeAddress': _motherOfficeAddressController.text,
//         'motherPhoneNumber': _motherPhoneNumberController.text,
//
//       });
//     } catch (error) {
//       // Handle the error
//       print('Error saving data: $error');
//     }
//   }
//
//
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailAddressController = TextEditingController();
//   final TextEditingController _rollNumberController = TextEditingController();
//   final TextEditingController _permanentAddressController = TextEditingController();
//   final TextEditingController _jeeRankController = TextEditingController();
//   final TextEditingController _mobileNumberController = TextEditingController();
//   TextEditingController _imageController = TextEditingController();
//   TextEditingController _yearController = TextEditingController();
//
//   final TextEditingController _fatherNameController = TextEditingController();
//   final TextEditingController _fatherOccupationController = TextEditingController();
//   final TextEditingController _fatherOfficeAddressController = TextEditingController();
//   final TextEditingController _fatherPhoneNumberController = TextEditingController();
//
//   final TextEditingController _motherNameController = TextEditingController();
//   final TextEditingController _motherOccupationController = TextEditingController();
//   final TextEditingController _motherOfficeAddressController = TextEditingController();
//   final TextEditingController _motherPhoneNumberController = TextEditingController();
//
//
//   @override
//
//   // void dispose() {
//   //   _fullNameController.dispose();
//   //   _emailAddressController.dispose();
//   //   _rollNumberController.dispose();
//   //   _permanentAddressController.dispose();
//   //   _jeeRankController.dispose();
//   //   _mobileNumberController.dispose();
//   //   _imageController.dispose();
//   //   _yearController.dispose();
//   //   _fatherNameController.dispose();
//   //   _fatherOccupationController.dispose();
//   //   _fatherOfficeAddressController.dispose();
//   //   _fatherPhoneNumberController.dispose();
//   //   _motherNameController.dispose();
//   //   _motherOccupationController.dispose();
//   //   _motherOfficeAddressController.dispose();
//   //   _motherPhoneNumberController.dispose();
//   //   super.dispose();
//   // }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff141318),
// //       body: Stack(
//       body: Stack(
// //
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
//             Column(
//               children: [
//                 SizedBox(
//                   height: 100,
//                 ),
//                 Text(
//                   'Student\'s Data Sheet',
//                   style: GoogleFonts.kufam(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 26,
//                       color: Color(0xff0CECDA)),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 // Headings and Slider
//                 Container(
//                   height: 50.0,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           _pageController.animateToPage(
//                             0,
//                             duration: Duration(milliseconds: 500),
//                             curve: Curves.easeInOut,
//                           );
//                         },
//                         child: Container(
//                           padding: EdgeInsets.symmetric(horizontal: 20.0),
//                           width: MediaQuery.sizeOf(context).width * 0.5,
//                           // color: _currentPage == 0 ? Colors.blue : Colors.grey,
//                           child: Center(
//                               child: Text(
//                                 'Student’s details',
//                                 style: GoogleFonts.kufam(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 14,
//                                     color: Color(0xff0CECDA)),
//                                 // textAlign: TextAlign.center,
//                               )
//                             // ),
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           _pageController.animateToPage(
//                             1,
//                             duration: Duration(milliseconds: 500),
//                             curve: Curves.easeInOut,
//                           );
//                         },
//                         child: Container(
//                           padding: EdgeInsets.symmetric(horizontal: 20.0),
//                           width: MediaQuery.sizeOf(context).width * 0.5,
//                           // color: _currentPage == 1 ? Colors.transparent : Colors.grey,
//                           child: Center(
//                             child: Text(
//                               'Parent Details',
//                               style: GoogleFonts.kufam(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14,
//                                   color: Color(0xff0CECDA)),
//                               // textAlign: TextAlign.center,)
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // Details PageView
//                 Expanded(
//                   child: PageView(
//                     controller: _pageController,
//                     onPageChanged: (index) {
//                       setState(() {
//                         _currentPage = index;
//                       });
//                     },
//                     children: [
//                       // Student Details
//                       ListView(children: [
//                         Container(
//                           padding: EdgeInsets.all(16.0),
//                           child: Form(
//                             // key: formKey,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   // controller: _fullNameController,
//                                   'Full Name',
//                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                 SizedBox(height: 5),
//                                 TextFormField(
//                                   controller: _fullNameController,
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'This field is required';
//                                     }
//                                     return null;
//                                   },
//                                   decoration: InputDecoration(
//                                     hintText: 'Shreya',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                     ),
//                                     hintStyle: GoogleFonts.kufam(
//                                         color: Colors.white.withOpacity(0.5)),
//                                     contentPadding: const EdgeInsets.symmetric(
//                                         vertical: 20.0, horizontal: 15.0),
//                                     border: OutlineInputBorder(),
//                                     fillColor: Color(0xff141318),
//                                     filled: true,
//                                   ),
//                                   style: TextStyle(color: Colors.white),),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//
//                                 Text('Email Address',
//                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                 SizedBox(height: 5),
//                                 TextFormField(
//                                   controller: _emailAddressController,
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'This field is required';
//                                     }
//                                     return null;
//                                   },
//                                   decoration: InputDecoration(
//                                     hintText: 'shreya@gmail.com',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                     ),
//                                     hintStyle: GoogleFonts.kufam(
//                                         color: Colors.white.withOpacity(0.5)),
//                                     contentPadding: const EdgeInsets.symmetric(
//                                         vertical: 20.0, horizontal: 15.0),
//                                     border: OutlineInputBorder(),
//                                     fillColor: Color(0xff141318),
//                                     filled: true,
//                                   ),
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//
//                                 Text('Roll No.',
//                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                 SizedBox(height: 5),
//                                 TextFormField(
//                                   controller: _rollNumberController,
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'This field is required';
//                                     }
//                                     return null;
//                                   },
//                                   decoration: InputDecoration(
//                                     hintText: '98753',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                     ),
//                                     hintStyle: GoogleFonts.kufam(
//                                         color: Colors.white.withOpacity(0.5)),
//                                     contentPadding: const EdgeInsets.symmetric(
//                                         vertical: 20.0, horizontal: 15.0),
//                                     border: OutlineInputBorder(),
//                                     fillColor: Color(0xff141318),
//                                     filled: true,
//                                   ),
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//
//                                 Text('Date of Birth',
//                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                 SizedBox(height: 5),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: TextFormField(
//                                         readOnly: true, // Disable manual editing
//                                         onTap: () => _selectDate(context),
//                                         decoration: InputDecoration(
//                                           hintText: 'Select a date',
//                                           enabledBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                           ),
//                                           focusedBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                           ),
//                                           hintStyle: TextStyle(
//                                             color: Colors.white.withOpacity(0.5),
//                                           ),
//                                           contentPadding: const EdgeInsets.symmetric(
//                                             vertical: 20.0,
//                                             horizontal: 15.0,
//                                           ),
//                                           border: OutlineInputBorder(),
//                                           fillColor: Color(0xff141318),
//                                           filled: true,
//                                         ),
//                                         style: TextStyle(color: Colors.white),
//                                         controller: TextEditingController(
//                                           text: "${selectedDate.toLocal()}".split(' ')[0],
//                                         ),
//                                       ),
//                                     ),
//                                     IconButton(
//                                       icon: Icon(Icons.calendar_today),
//                                       onPressed: () => _selectDate(context),
//                                       color: Colors.white,
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//
//                                 Text('Address',
//                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                 SizedBox(height: 5),
//                                 TextFormField(
//                                   controller: _permanentAddressController,
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'This field is required';
//                                     }
//                                     return null;
//                                   },
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter permanent address',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                     ),
//                                     hintStyle: GoogleFonts.kufam(
//                                         color: Colors.white.withOpacity(0.5)),
//                                     contentPadding: const EdgeInsets.symmetric(
//                                         vertical: 20.0, horizontal: 15.0),
//                                     border: OutlineInputBorder(),
//                                     fillColor: Color(0xff141318),
//                                     filled: true,
//                                   ),
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//
//                                 Text('Year of admission',
//                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                 SizedBox(height: 5),
//                                 Padding(
//                                   padding: const EdgeInsets.all(0),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       showYearPicker(context);
//                                     },
//                                     child: AbsorbPointer(
//                                       child: TextField(
//                                         readOnly: true,
//                                         controller: TextEditingController(text: selectedYearofAdmission),
//                                         decoration: InputDecoration(
//                                           hintText: 'Select',
//                                           enabledBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                           ),
//                                           suffixIcon: Icon(Icons.arrow_drop_down,
//                                             size: 40.0,),
//                                           focusedBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                           ),
//                                           hintStyle: GoogleFonts.kufam(
//                                               color: Colors.white.withOpacity(0.5)),
//                                           contentPadding: const EdgeInsets.symmetric(
//                                               vertical: 20.0, horizontal: 15.0),
//                                           border: OutlineInputBorder(),
//                                           fillColor: Color(0xff141318),
//                                           filled: true,
//                                         ),
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                     ),
//                                   ),),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//
//                                 Text('JEE Rank',
//                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                 SizedBox(height: 5),
//                                 TextFormField(
//                                   controller: _jeeRankController,
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'This field is required';
//                                     }
//                                     return null;
//                                   },
//                                   decoration: InputDecoration(
//                                     hintText: '54728',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                     ),
//                                     hintStyle: GoogleFonts.kufam(
//                                         color: Colors.white.withOpacity(0.5)),
//                                     contentPadding: const EdgeInsets.symmetric(
//                                         vertical: 20.0, horizontal: 15.0),
//                                     border: OutlineInputBorder(),
//                                     fillColor: Color(0xff141318),
//                                     filled: true,
//                                   ),
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//
//                                 Text('Mobile No.',
//                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                 SizedBox(height: 5),
//                                 TextFormField(
//                                   controller: _mobileNumberController,
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'This field is required';
//                                     }
//                                     return null;
//                                   },
//                                   decoration: InputDecoration(
//                                     hintText: '98765XXXXX',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                     ),
//                                     hintStyle: GoogleFonts.kufam(
//                                         color: Colors.white.withOpacity(0.5)),
//                                     contentPadding: const EdgeInsets.symmetric(
//                                         vertical: 20.0, horizontal: 15.0),
//                                     border: OutlineInputBorder(),
//                                     fillColor: Color(0xff141318),
//                                     filled: true,
//                                   ),
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//
//                                 Text('Upload Photograph',
//                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                 SizedBox(height: 5),
//                                 Padding(
//                                   padding: const EdgeInsets.all(0.0),
//                                   child:
//                                   Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children:[
//                                         Stack(
//                                             children:[ TextField(
//                                               controller: _imageController,
//                                               readOnly: true,
//                                               decoration: InputDecoration(
//                                                 hintText: 'Browse',
//                                                 suffixIcon: IconButton(
//                                                   icon: Icon(Icons.add, size: 25.0,),
//                                                   onPressed: () {
//                                                     _pickImage();
//                                                   },),
//                                                 enabledBorder: OutlineInputBorder(
//                                                   borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                                 ),
//                                                 focusedBorder: OutlineInputBorder(
//                                                   borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                                 ),
//                                                 hintStyle: GoogleFonts.kufam(
//                                                     color: Colors.white.withOpacity(0.5)),
//                                                 contentPadding: const EdgeInsets.symmetric(
//                                                     vertical: 20.0, horizontal: 15.0),
//                                                 border: OutlineInputBorder(),
//                                                 fillColor: Color(0xff141318),
//                                                 filled: true,
//                                               ),
//                                               style: TextStyle(color: Colors.white),
//
//                                             ),
//                                             ]
//                                           //     if (_selectedImage != null)
//                                           // Image.file(
//                                           //   File(_selectedImage),
//                                           //   height: 100,
//                                           //   width: 100,
//
//                                         ),]
//                                   ),
//                                 ),
//                                 SizedBox(height: 20),
//
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     if (Form.of(context)!.validate()) {
//                                       _saveStudentData();
//                                       // If all fields are valid, navigate to the next screen
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(builder: (context) => StudentSelectionScreen()),
//                                       );
//                                     }
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Color(0xFF13E9DC),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                                     minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
//                                   ),
//                                   child: Text(
//                                     'Next',
//                                     style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ]),
//
//                       // Teacher Details
//                       ListView(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(16.0),
//                             child: Form(
//                               // key: formKey,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Father Details',
//                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.white),),
//                                   SizedBox(height: 5),
//
//                                   Text('Father’s Name',
//                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                   SizedBox(height: 5),
//                                   TextFormField(
//                                     controller: _fatherNameController,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'This field is required';
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                       hintText: 'Name',
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                       ),
//                                       hintStyle: GoogleFonts.kufam(
//                                           color: Colors.white.withOpacity(0.5)),
//                                       contentPadding: const EdgeInsets.symmetric(
//                                           vertical: 20.0, horizontal: 15.0),
//                                       border: OutlineInputBorder(),
//                                       fillColor: Color(0xff141318),
//                                       filled: true,
//                                     ),
//                                     style: TextStyle(color: Colors.white),),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//
//                                   Text('Occupation',
//                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                   SizedBox(height: 5),
//                                   TextFormField(
//                                     controller:_fatherOccupationController ,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'This field is required';
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                       hintText: 'Business',
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                       ),
//                                       hintStyle: GoogleFonts.kufam(
//                                           color: Colors.white.withOpacity(0.5)),
//                                       contentPadding: const EdgeInsets.symmetric(
//                                           vertical: 20.0, horizontal: 15.0),
//                                       border: OutlineInputBorder(),
//                                       fillColor: Color(0xff141318),
//                                       filled: true,
//                                     ),
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//
//                                   Text('Office Address',
//                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                   SizedBox(height: 5),
//                                   TextFormField(
//                                     controller: _fatherOfficeAddressController,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'This field is required';
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                       hintText: 'Enter address',
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                       ),
//                                       hintStyle: GoogleFonts.kufam(
//                                           color: Colors.white.withOpacity(0.5)),
//                                       contentPadding: const EdgeInsets.symmetric(
//                                           vertical: 20.0, horizontal: 15.0),
//                                       border: OutlineInputBorder(),
//                                       fillColor: Color(0xff141318),
//                                       filled: true,
//                                     ),
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//
//                                   Text('Official Phone No.',
//                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                   SizedBox(height: 5),
//                                   TextFormField(
//                                     controller: _fatherPhoneNumberController,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'This field is required';
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                       hintText: '98765XXXX',
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                       ),
//                                       hintStyle: GoogleFonts.kufam(
//                                           color: Colors.white.withOpacity(0.5)),
//                                       contentPadding: const EdgeInsets.symmetric(
//                                           vertical: 20.0, horizontal: 18.0),
//                                       border: OutlineInputBorder(),
//                                       fillColor: Color(0xff141318),
//                                       filled: true,
//                                     ),
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Text('Mother Details',
//                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.white),),
//                                   SizedBox(height: 5),
//
//                                   Text('Mother’s Name',
//                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                   SizedBox(height: 5),
//                                   TextFormField(
//                                     controller: _motherNameController,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'This field is required';
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                       hintText: 'Name',
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                       ),
//                                       hintStyle: GoogleFonts.kufam(
//                                           color: Colors.white.withOpacity(0.5)),
//                                       contentPadding: const EdgeInsets.symmetric(
//                                           vertical: 20.0, horizontal: 18.0),
//                                       border: OutlineInputBorder(),
//                                       fillColor: Color(0xff141318),
//                                       filled: true,
//                                     ),
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//
//                                   Text('Occupation',
//                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                   SizedBox(height: 5),
//                                   TextFormField(
//                                     controller: _motherOccupationController,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'This field is required';
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                       hintText: 'Business',
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                       ),
//                                       hintStyle: GoogleFonts.kufam(
//                                           color: Colors.white.withOpacity(0.5)),
//                                       contentPadding: const EdgeInsets.symmetric(
//                                           vertical: 20.0, horizontal: 18.0),
//                                       border: OutlineInputBorder(),
//                                       fillColor: Color(0xff141318),
//                                       filled: true,
//                                     ),
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//
//                                   Text('Office Address',
//                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                   SizedBox(height: 5),
//                                   TextFormField(
//                                     controller: _motherOfficeAddressController,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'This field is required';
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                       hintText: 'Enter address',
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                       ),
//                                       hintStyle: GoogleFonts.kufam(
//                                           color: Colors.white.withOpacity(0.5)),
//                                       contentPadding: const EdgeInsets.symmetric(
//                                           vertical: 20.0, horizontal: 18.0),
//                                       border: OutlineInputBorder(),
//                                       fillColor: Color(0xff141318),
//                                       filled: true,
//                                     ),
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//
//                                   Text('Official Phone No.',
//                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
//                                   SizedBox(height: 5),
//                                   TextFormField(
//                                     controller: _motherPhoneNumberController,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'This field is required';
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                       hintText: '98765XXXXX',
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
//                                       ),
//                                       hintStyle: GoogleFonts.kufam(
//                                           color: Colors.white.withOpacity(0.5)),
//                                       contentPadding: const EdgeInsets.symmetric(
//                                           vertical: 20.0, horizontal: 15.0),
//                                       border: OutlineInputBorder(),
//                                       fillColor: Color(0xff141318),
//                                       filled: true,
//                                     ),
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   SizedBox(height: 20),
//
//                                   // ElevatedButton(
//                                   //   onPressed: () {
//                                   //     if (Form.of(context)!.validate()) {
//                                   //       _saveStudentData();
//                                   //       Navigator.push(
//                                   //         context,
//                                   //         MaterialPageRoute(builder: (context) => StudentSelectionScreen()),
//                                   //       );
//                                   //     }
//                                   //   },
//                                   //   style: ElevatedButton.styleFrom(
//                                   //     backgroundColor: Color(0xFF13E9DC),
//                                   //     shape: RoundedRectangleBorder(
//                                   //       borderRadius: BorderRadius.circular(20.0),
//                                   //     ),
//                                   //     minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
//                                   //   ),
//                                   //   child: Text(
//                                   //     'Next',
//                                   //     style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
//                                   //   ),
//                                   // ),
//                                   ElevatedButton(
//                                     onPressed: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(builder: (context) => StudentSelectionScreen()),
//                                       );
//                                       _saveStudentData();
//                                     },
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Color(0xFF13E9DC),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(20.0),
//                                       ),
//                                       minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
//                                     ),
//                                     child: Text(
//                                       'Save',
//                                       style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ]),
//     );
//   }
// }
//
// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:majorproject/academic_activity_screen.dart';
// // import 'package:majorproject/student_main_screen.dart';
// // import 'package:majorproject/teacher_main_screen.dart';
// // import 'package:image_picker/image_picker.dart';
// // // import 'package:firebase_core/firebase_core.dart';
// //
// //
// // class studentDataSheet extends StatefulWidget {
// //   @override
// //   _studentDataSheetState createState() => _studentDataSheetState();
// // }
// //
// // class _studentDataSheetState extends State<studentDataSheet> {
// //
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// //
// //   final DatabaseReference _studentRef =
// //   FirebaseDatabase.instance.ref().child('student');
// //
// //   String _selectedImage='';
// //   String selectedYearofAdmission ='';
// //   List<String> years = List.generate(25, (index) => (2000 + index).toString());
// //
// //
// //   PageController _pageController = PageController(initialPage: 0);
// //   int _currentPage = 0;
// //
// //   DateTime selectedDate = DateTime.now();
// //
// //
// //
// //   Future<void> _selectDate(BuildContext context) async {
// //     final DateTime? picked = await showDatePicker(
// //       context: context,
// //       initialDate: selectedDate,
// //       firstDate: DateTime(1900),
// //       lastDate: DateTime.now(),
// //     );
// //
// //     if (picked != null && picked != selectedDate) {
// //       setState(() {
// //         selectedDate = picked;
// //       });
// //     }
// //   }
// //
// //
// //   void showYearPicker(BuildContext context) {
// //     showModalBottomSheet(
// //       context: context,
// //       builder: (BuildContext builder) {
// //         return Container(
// //           height: 200,
// //           child: ListWheelScrollView(
// //             itemExtent: 40,
// //             children: years.map((String year) {
// //               return ListTile(
// //                 title: Center(
// //                   child: Text(
// //                     year,
// //                     style: TextStyle(fontSize: 18),
// //                   ),
// //                 ),
// //                 onTap: () {
// //                   setState(() {
// //                     selectedYearofAdmission = year;
// //                     _yearController.text = selectedYearofAdmission; // Set the text in the controller
// //                   });
// //                   Navigator.of(context).pop();
// //                 },
// //               );
// //             }).toList(),
// //           ),
// //         );
// //       },
// //     );
// //   }
// //
// //
// //   Future<void> _pickImage() async {
// //     final picker = ImagePicker();
// //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
// //
// //     if (pickedFile != null) {
// //       setState(() {
// //         _selectedImage = pickedFile.path;
// //         _imageController.text = _selectedImage;
// //       });
// //     }
// //   }
// //
// //   Future<void> _saveStudentData() async {
// //     try {
// //       await _studentRef.child('id').child(_rollNumberController.text).set({
// //         'fullName': _fullNameController.text,
// //         'emailAddress': _emailAddressController.text,
// //         'rollNumber': _rollNumberController.text,
// //         'dateOfBirth': selectedDate.toLocal().toString(),
// //         'permanentAddress': _permanentAddressController.text,
// //         'jeeRank': _jeeRankController.text,
// //         'mobileNumber': _mobileNumberController.text,
// //         'image': _imageController.text,
// //         'year': _yearController.text,
// //         'fatherName': _fatherNameController.text,
// //         'fatherOccupation': _fatherOccupationController.text,
// //         'fatherOfficeAddress': _fatherOfficeAddressController.text,
// //         'fatherPhoneNumber': _fatherPhoneNumberController.text,
// //         'motherName': _motherNameController.text,
// //         'motherOccupation': _motherOccupationController.text,
// //         'motherOfficeAddress': _motherOfficeAddressController.text,
// //         'motherPhoneNumber': _motherPhoneNumberController.text,
// //
// //       });
// //     } catch (error) {
// //       // Handle the error
// //       print('Error saving data: $error');
// //     }
// //   }
// //
// //
// //   final TextEditingController _fullNameController = TextEditingController();
// //   final TextEditingController _emailAddressController = TextEditingController();
// //   final TextEditingController _rollNumberController = TextEditingController();
// //   final TextEditingController _permanentAddressController = TextEditingController();
// //   final TextEditingController _jeeRankController = TextEditingController();
// //   final TextEditingController _mobileNumberController = TextEditingController();
// //   TextEditingController _imageController = TextEditingController();
// //   TextEditingController _yearController = TextEditingController();
// //
// //   final TextEditingController _fatherNameController = TextEditingController();
// //   final TextEditingController _fatherOccupationController = TextEditingController();
// //   final TextEditingController _fatherOfficeAddressController = TextEditingController();
// //   final TextEditingController _fatherPhoneNumberController = TextEditingController();
// //
// //   final TextEditingController _motherNameController = TextEditingController();
// //   final TextEditingController _motherOccupationController = TextEditingController();
// //   final TextEditingController _motherOfficeAddressController = TextEditingController();
// //   final TextEditingController _motherPhoneNumberController = TextEditingController();
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color(0xff141318),
// // //       body: Stack(
// //       body: Stack(
// // //
// //           children: [
// //             Positioned(
// //               top: 0,
// //               left: 0,
// //               right: 0,
// //               child: Image.asset(
// //                 'images/bottom_container.png',
// //                 fit: BoxFit.cover,
// //                 height: 200,
// //                 width: MediaQuery.sizeOf(context)
// //                     .width, // Adjust the height as needed
// //               ),
// //             ),
// //             Column(
// //               children: [
// //                 SizedBox(
// //                   height: 100,
// //                 ),
// //                 Text(
// //                   'Student\'s Data Sheet',
// //                   style: GoogleFonts.kufam(
// //                       fontWeight: FontWeight.w600,
// //                       fontSize: 26,
// //                       color: Color(0xff0CECDA)),
// //                 ),
// //                 SizedBox(
// //                   height: 20,
// //                 ),
// //                 // Headings and Slider
// //                 Container(
// //                   height: 50.0,
// //                   child: ListView(
// //                     scrollDirection: Axis.horizontal,
// //                     children: [
// //                       GestureDetector(
// //                         onTap: () {
// //                           _pageController.animateToPage(
// //                             0,
// //                             duration: Duration(milliseconds: 500),
// //                             curve: Curves.easeInOut,
// //                           );
// //                         },
// //                         child: Container(
// //                           padding: EdgeInsets.symmetric(horizontal: 20.0),
// //                           width: MediaQuery.sizeOf(context).width * 0.5,
// //                           // color: _currentPage == 0 ? Colors.blue : Colors.grey,
// //                           child: Center(
// //                               child: Text(
// //                             'Student’s details',
// //                             style: GoogleFonts.kufam(
// //                                 fontWeight: FontWeight.w400,
// //                                 fontSize: 14,
// //                                 color: Color(0xff0CECDA)),
// //                             // textAlign: TextAlign.center,
// //                           )
// //                               // ),
// //                               ),
// //                         ),
// //                       ),
// //                       GestureDetector(
// //                         onTap: () {
// //                           _pageController.animateToPage(
// //                             1,
// //                             duration: Duration(milliseconds: 500),
// //                             curve: Curves.easeInOut,
// //                           );
// //                         },
// //                         child: Container(
// //                           padding: EdgeInsets.symmetric(horizontal: 20.0),
// //                           width: MediaQuery.sizeOf(context).width * 0.5,
// //                           // color: _currentPage == 1 ? Colors.transparent : Colors.grey,
// //                           child: Center(
// //                             child: Text(
// //                               'Parent Details',
// //                               style: GoogleFonts.kufam(
// //                                   fontWeight: FontWeight.w400,
// //                                   fontSize: 14,
// //                                   color: Color(0xff0CECDA)),
// //                               // textAlign: TextAlign.center,)
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //
// //                 // Details PageView
// //                 Expanded(
// //                   child: PageView(
// //                     controller: _pageController,
// //                     onPageChanged: (index) {
// //                       setState(() {
// //                         _currentPage = index;
// //                       });
// //                     },
// //                     children: [
// //                       // Student Details
// //                       ListView(children: [
// //                         Container(
// //                           padding: EdgeInsets.all(16.0),
// //                           child: Form(
// //                             key: _formKey,
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   // controller: _fullNameController,
// //                                   'Full Name',
// //                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                 SizedBox(height: 5),
// //                                 TextFormField(
// //                                   controller: _fullNameController,
// //                                   validator: (value) {
// //                                     if (value == null || value.isEmpty) {
// //                                       return 'This field is required';
// //                                     }
// //                                     return null;
// //                                   },
// //                                     decoration: InputDecoration(
// //                                   hintText: 'Shreya',
// //                                       enabledBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                       ),
// //                                       focusedBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                       ),
// //                                   hintStyle: GoogleFonts.kufam(
// //                                       color: Colors.white.withOpacity(0.5)),
// //                                   contentPadding: const EdgeInsets.symmetric(
// //                                       vertical: 20.0, horizontal: 15.0),
// //                                   border: OutlineInputBorder(),
// //                                   fillColor: Color(0xff141318),
// //                                   filled: true,
// //                                 ),
// //                                   style: TextStyle(color: Colors.white),),
// //                                 SizedBox(
// //                                   height: 20,
// //                                 ),
// //
// //                                 Text('Email Address',
// //                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                 SizedBox(height: 5),
// //                                 TextFormField(
// //                                   controller: _emailAddressController,
// //                                   validator: (value) {
// //                                     if (value == null || value.isEmpty) {
// //                                       return 'This field is required';
// //                                     }
// //                                     return null;
// //                                   },
// //                                   decoration: InputDecoration(
// //                                     hintText: 'shreya@gmail.com',
// //                                     enabledBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                     ),
// //                                     focusedBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                     ),
// //                                     hintStyle: GoogleFonts.kufam(
// //                                         color: Colors.white.withOpacity(0.5)),
// //                                     contentPadding: const EdgeInsets.symmetric(
// //                                         vertical: 20.0, horizontal: 15.0),
// //                                     border: OutlineInputBorder(),
// //                                     fillColor: Color(0xff141318),
// //                                     filled: true,
// //                                   ),
// //                                   style: TextStyle(color: Colors.white),
// //                                 ),
// //                                 SizedBox(
// //                                   height: 20,
// //                                 ),
// //
// //                                 Text('Roll No.',
// //                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                 SizedBox(height: 5),
// //                                 TextFormField(
// //                                   controller: _rollNumberController,
// //                                   validator: (value) {
// //                                     if (value == null || value.isEmpty) {
// //                                       return 'This field is required';
// //                                     }
// //                                     return null;
// //                                   },
// //                                   decoration: InputDecoration(
// //                                     hintText: '98753',
// //                                     enabledBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                     ),
// //                                     focusedBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                     ),
// //                                     hintStyle: GoogleFonts.kufam(
// //                                         color: Colors.white.withOpacity(0.5)),
// //                                     contentPadding: const EdgeInsets.symmetric(
// //                                         vertical: 20.0, horizontal: 15.0),
// //                                     border: OutlineInputBorder(),
// //                                     fillColor: Color(0xff141318),
// //                                     filled: true,
// //                                   ),
// //                                   style: TextStyle(color: Colors.white),
// //                                 ),
// //                                 SizedBox(
// //                                   height: 20,
// //                                 ),
// //
// //                                 Text('Date of Birth',
// //                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                 SizedBox(height: 5),
// //                                 Row(
// //                                   children: [
// //                                     Expanded(
// //                                       child: TextFormField(
// //                                         readOnly: true, // Disable manual editing
// //                                         onTap: () => _selectDate(context),
// //                                         decoration: InputDecoration(
// //                                           hintText: 'Select a date',
// //                                           enabledBorder: OutlineInputBorder(
// //                                             borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                           ),
// //                                           focusedBorder: OutlineInputBorder(
// //                                             borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                           ),
// //                                           hintStyle: TextStyle(
// //                                             color: Colors.white.withOpacity(0.5),
// //                                           ),
// //                                           contentPadding: const EdgeInsets.symmetric(
// //                                             vertical: 20.0,
// //                                             horizontal: 15.0,
// //                                           ),
// //                                           border: OutlineInputBorder(),
// //                                           fillColor: Color(0xff141318),
// //                                           filled: true,
// //                                         ),
// //                                         style: TextStyle(color: Colors.white),
// //                                         controller: TextEditingController(
// //                                           text: "${selectedDate.toLocal()}".split(' ')[0],
// //                                         ),
// //                                       ),
// //                                     ),
// //                                     IconButton(
// //                                       icon: Icon(Icons.calendar_today),
// //                                       onPressed: () => _selectDate(context),
// //                                       color: Colors.white,
// //                                     ),
// //                                   ],
// //                                 ),
// //                                 SizedBox(
// //                                   height: 20,
// //                                 ),
// //
// //                                 Text('Address',
// //                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                 SizedBox(height: 5),
// //                                 TextFormField(
// //                                   controller: _permanentAddressController,
// //                                   validator: (value) {
// //                                     if (value == null || value.isEmpty) {
// //                                       return 'This field is required';
// //                                     }
// //                                     return null;
// //                                   },
// //                                   decoration: InputDecoration(
// //                                     hintText: 'Enter permanent address',
// //                                     enabledBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                     ),
// //                                     focusedBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                     ),
// //                                     hintStyle: GoogleFonts.kufam(
// //                                         color: Colors.white.withOpacity(0.5)),
// //                                     contentPadding: const EdgeInsets.symmetric(
// //                                         vertical: 20.0, horizontal: 15.0),
// //                                     border: OutlineInputBorder(),
// //                                     fillColor: Color(0xff141318),
// //                                     filled: true,
// //                                   ),
// //                                   style: TextStyle(color: Colors.white),
// //                                 ),
// //                                 SizedBox(
// //                                   height: 20,
// //                                 ),
// //
// //                                 Text('Year of admission',
// //                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                 SizedBox(height: 5),
// //                                 Padding(
// //                                   padding: const EdgeInsets.all(0),
// //                                   child: GestureDetector(
// //                                     onTap: () {
// //                                         showYearPicker(context);
// //                                         },
// //                                   child: AbsorbPointer(
// //                                     child: TextField(
// //                                       readOnly: true,
// //                                       controller: TextEditingController(text: selectedYearofAdmission),
// //                                       decoration: InputDecoration(
// //                                         hintText: 'Select',
// //                                         enabledBorder: OutlineInputBorder(
// //                                           borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                         ),
// //                                         suffixIcon: Icon(Icons.arrow_drop_down,
// //                                         size: 40.0,),
// //                                         focusedBorder: OutlineInputBorder(
// //                                           borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                         ),
// //                                         hintStyle: GoogleFonts.kufam(
// //                                             color: Colors.white.withOpacity(0.5)),
// //                                         contentPadding: const EdgeInsets.symmetric(
// //                                             vertical: 20.0, horizontal: 15.0),
// //                                         border: OutlineInputBorder(),
// //                                         fillColor: Color(0xff141318),
// //                                         filled: true,
// //                                       ),
// //                                       style: TextStyle(color: Colors.white),
// //                                     ),
// //                                   ),
// //                                 ),),
// //                                 SizedBox(
// //                                   height: 20,
// //                                 ),
// //
// //                                 Text('JEE Rank',
// //                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                 SizedBox(height: 5),
// //                                 TextFormField(
// //                                   controller: _jeeRankController,
// //                                   validator: (value) {
// //                                     if (value == null || value.isEmpty) {
// //                                       return 'This field is required';
// //                                     }
// //                                     return null;
// //                                   },
// //                                   decoration: InputDecoration(
// //                                     hintText: '54728',
// //                                     enabledBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                     ),
// //                                     focusedBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                     ),
// //                                     hintStyle: GoogleFonts.kufam(
// //                                         color: Colors.white.withOpacity(0.5)),
// //                                     contentPadding: const EdgeInsets.symmetric(
// //                                         vertical: 20.0, horizontal: 15.0),
// //                                     border: OutlineInputBorder(),
// //                                     fillColor: Color(0xff141318),
// //                                     filled: true,
// //                                   ),
// //                                   style: TextStyle(color: Colors.white),
// //                                 ),
// //                                 SizedBox(
// //                                   height: 20,
// //                                 ),
// //
// //                                 Text('Mobile No.',
// //                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                 SizedBox(height: 5),
// //                                 TextFormField(
// //                                   controller: _mobileNumberController,
// //                                   validator: (value) {
// //                                     if (value == null || value.isEmpty) {
// //                                       return 'This field is required';
// //                                     }
// //                                     return null;
// //                                   },
// //                                   decoration: InputDecoration(
// //                                     hintText: '98765XXXXX',
// //                                     enabledBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                     ),
// //                                     focusedBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                     ),
// //                                     hintStyle: GoogleFonts.kufam(
// //                                         color: Colors.white.withOpacity(0.5)),
// //                                     contentPadding: const EdgeInsets.symmetric(
// //                                         vertical: 20.0, horizontal: 15.0),
// //                                     border: OutlineInputBorder(),
// //                                     fillColor: Color(0xff141318),
// //                                     filled: true,
// //                                   ),
// //                                   style: TextStyle(color: Colors.white),
// //                                 ),
// //                                 SizedBox(
// //                                   height: 20,
// //                                 ),
// //
// //                                 Text('Upload Photograph',
// //                                   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                 SizedBox(height: 5),
// //                                 Padding(
// //                                   padding: const EdgeInsets.all(0.0),
// //                                   child:
// //                                   Column(
// //                                     crossAxisAlignment: CrossAxisAlignment.start,
// //                                     children:[
// //                                       Stack(
// //                                         children:[ TextField(
// //                                           controller: _imageController,
// //                                         readOnly: true,
// //                                         decoration: InputDecoration(
// //                                           hintText: 'Browse',
// //                                             suffixIcon: IconButton(
// //                                                 icon: Icon(Icons.add, size: 25.0,),
// //                                               onPressed: () {
// //                                                 _pickImage();
// //                                               },),
// //                                           enabledBorder: OutlineInputBorder(
// //                                             borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                           ),
// //                                           focusedBorder: OutlineInputBorder(
// //                                             borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                           ),
// //                                           hintStyle: GoogleFonts.kufam(
// //                                               color: Colors.white.withOpacity(0.5)),
// //                                           contentPadding: const EdgeInsets.symmetric(
// //                                               vertical: 20.0, horizontal: 15.0),
// //                                           border: OutlineInputBorder(),
// //                                           fillColor: Color(0xff141318),
// //                                           filled: true,
// //                                         ),
// //                                         style: TextStyle(color: Colors.white),
// //
// //                                                                           ),
// //                                 ]
// //                                       //     if (_selectedImage != null)
// //                                       // Image.file(
// //                                       //   File(_selectedImage),
// //                                       //   height: 100,
// //                                       //   width: 100,
// //
// //                                       ),]
// //                                   ),
// //                                 ),
// //                                 SizedBox(height: 20),
// //
// //                                 ElevatedButton(
// //                                   onPressed: () {
// //                                     if (_formKey.currentState!.validate()) {
// //                                       // If all fields are valid, navigate to the next screen
// //                                       Navigator.push(
// //                                         context,
// //                                         MaterialPageRoute(builder: (context) => StudentSelectionScreen()),
// //                                       );
// //                                     }
// //                                   },
// //                                   style: ElevatedButton.styleFrom(
// //                                     backgroundColor: Color(0xFF13E9DC),
// //                                     shape: RoundedRectangleBorder(
// //                                       borderRadius: BorderRadius.circular(20.0),
// //                                     ),
// //                                     minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
// //                                   ),
// //                                   child: Text(
// //                                     'Next',
// //                                     style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                       ]),
// //
// //                       // Teacher Details
// //                       ListView(
// //                         children: [
// //                           Container(
// //                             padding: EdgeInsets.all(16.0),
// //                             child: Form(
// //                               key: _formKey,
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Text('Father Details',
// //                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.white),),
// //                                   SizedBox(height: 5),
// //
// //                                   Text('Father’s Name',
// //                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                   SizedBox(height: 5),
// //                                   TextFormField(
// //                                     controller: _fatherNameController,
// //                                     validator: (value) {
// //                                       if (value == null || value.isEmpty) {
// //                                         return 'This field is required';
// //                                       }
// //                                       return null;
// //                                     },
// //                                       decoration: InputDecoration(
// //                                     hintText: 'Name',
// //                                         enabledBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                       ),
// //                                         focusedBorder: OutlineInputBorder(
// //                                           borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                         ),
// //                                     hintStyle: GoogleFonts.kufam(
// //                                         color: Colors.white.withOpacity(0.5)),
// //                                     contentPadding: const EdgeInsets.symmetric(
// //                                         vertical: 20.0, horizontal: 15.0),
// //                                     border: OutlineInputBorder(),
// //                                     fillColor: Color(0xff141318),
// //                                     filled: true,
// //                                   ),
// //                                     style: TextStyle(color: Colors.white),),
// //                                   SizedBox(
// //                                     height: 20,
// //                                   ),
// //
// //                                   Text('Occupation',
// //                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                   SizedBox(height: 5),
// //                                   TextFormField(
// //                                     controller:_fatherOccupationController ,
// //                                     validator: (value) {
// //                                       if (value == null || value.isEmpty) {
// //                                         return 'This field is required';
// //                                       }
// //                                       return null;
// //                                     },
// //                                     decoration: InputDecoration(
// //                                       hintText: 'Business',
// //                                       enabledBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                       ),
// //                                       focusedBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                       ),
// //                                       hintStyle: GoogleFonts.kufam(
// //                                           color: Colors.white.withOpacity(0.5)),
// //                                       contentPadding: const EdgeInsets.symmetric(
// //                                           vertical: 20.0, horizontal: 15.0),
// //                                       border: OutlineInputBorder(),
// //                                       fillColor: Color(0xff141318),
// //                                       filled: true,
// //                                     ),
// //                                     style: TextStyle(color: Colors.white),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 20,
// //                                   ),
// //
// //                                   Text('Office Address',
// //                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                   SizedBox(height: 5),
// //                                   TextFormField(
// //                                     controller: _fatherOfficeAddressController,
// //                                     validator: (value) {
// //                                       if (value == null || value.isEmpty) {
// //                                         return 'This field is required';
// //                                       }
// //                                       return null;
// //                                     },
// //                                     decoration: InputDecoration(
// //                                       hintText: 'Enter address',
// //                                       enabledBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                       ),
// //                                       focusedBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                       ),
// //                                       hintStyle: GoogleFonts.kufam(
// //                                           color: Colors.white.withOpacity(0.5)),
// //                                       contentPadding: const EdgeInsets.symmetric(
// //                                           vertical: 20.0, horizontal: 15.0),
// //                                       border: OutlineInputBorder(),
// //                                       fillColor: Color(0xff141318),
// //                                       filled: true,
// //                                     ),
// //                                     style: TextStyle(color: Colors.white),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 20,
// //                                   ),
// //
// //                                   Text('Official Phone No.',
// //                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                   SizedBox(height: 5),
// //                                   TextFormField(
// //                                     controller: _fatherPhoneNumberController,
// //                                     validator: (value) {
// //                                       if (value == null || value.isEmpty) {
// //                                         return 'This field is required';
// //                                       }
// //                                       return null;
// //                                     },
// //                                     decoration: InputDecoration(
// //                                       hintText: '98765XXXX',
// //                                       enabledBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                       ),
// //                                       focusedBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                       ),
// //                                       hintStyle: GoogleFonts.kufam(
// //                                           color: Colors.white.withOpacity(0.5)),
// //                                       contentPadding: const EdgeInsets.symmetric(
// //                                           vertical: 20.0, horizontal: 18.0),
// //                                       border: OutlineInputBorder(),
// //                                       fillColor: Color(0xff141318),
// //                                       filled: true,
// //                                     ),
// //                                     style: TextStyle(color: Colors.white),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 20,
// //                                   ),
// //                                   Text('Mother Details',
// //                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.white),),
// //                                   SizedBox(height: 5),
// //
// //                                   Text('Mother’s Name',
// //                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                   SizedBox(height: 5),
// //                                   TextFormField(
// //                                     controller: _motherNameController,
// //                                     validator: (value) {
// //                                       if (value == null || value.isEmpty) {
// //                                         return 'This field is required';
// //                                       }
// //                                       return null;
// //                                     },
// //                                     decoration: InputDecoration(
// //                                       hintText: 'Name',
// //                                       enabledBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                       ),
// //                                       focusedBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                       ),
// //                                       hintStyle: GoogleFonts.kufam(
// //                                           color: Colors.white.withOpacity(0.5)),
// //                                       contentPadding: const EdgeInsets.symmetric(
// //                                           vertical: 20.0, horizontal: 18.0),
// //                                       border: OutlineInputBorder(),
// //                                       fillColor: Color(0xff141318),
// //                                       filled: true,
// //                                     ),
// //                                     style: TextStyle(color: Colors.white),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 20,
// //                                   ),
// //
// //                                   Text('Occupation',
// //                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                   SizedBox(height: 5),
// //                                   TextFormField(
// //                                     controller: _motherOccupationController,
// //                                     validator: (value) {
// //                                       if (value == null || value.isEmpty) {
// //                                         return 'This field is required';
// //                                       }
// //                                       return null;
// //                                     },
// //                                     decoration: InputDecoration(
// //                                       hintText: 'Business',
// //                                       enabledBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                       ),
// //                                       focusedBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                       ),
// //                                       hintStyle: GoogleFonts.kufam(
// //                                           color: Colors.white.withOpacity(0.5)),
// //                                       contentPadding: const EdgeInsets.symmetric(
// //                                           vertical: 20.0, horizontal: 18.0),
// //                                       border: OutlineInputBorder(),
// //                                       fillColor: Color(0xff141318),
// //                                       filled: true,
// //                                     ),
// //                                     style: TextStyle(color: Colors.white),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 20,
// //                                   ),
// //
// //                                   Text('Office Address',
// //                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                   SizedBox(height: 5),
// //                                   TextFormField(
// //                                     controller: _motherOfficeAddressController,
// //                                     validator: (value) {
// //                                       if (value == null || value.isEmpty) {
// //                                         return 'This field is required';
// //                                       }
// //                                       return null;
// //                                     },
// //                                     decoration: InputDecoration(
// //                                       hintText: 'Enter address',
// //                                       enabledBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                       ),
// //                                       focusedBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                       ),
// //                                       hintStyle: GoogleFonts.kufam(
// //                                           color: Colors.white.withOpacity(0.5)),
// //                                       contentPadding: const EdgeInsets.symmetric(
// //                                           vertical: 20.0, horizontal: 18.0),
// //                                       border: OutlineInputBorder(),
// //                                       fillColor: Color(0xff141318),
// //                                       filled: true,
// //                                     ),
// //                                     style: TextStyle(color: Colors.white),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 20,
// //                                   ),
// //
// //                                   Text('Official Phone No.',
// //                                     style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
// //                                   SizedBox(height: 5),
// //                                   TextFormField(
// //                                     controller: _motherPhoneNumberController,
// //                                     validator: (value) {
// //                                       if (value == null || value.isEmpty) {
// //                                         return 'This field is required';
// //                                       }
// //                                       return null;
// //                                     },
// //                                     decoration: InputDecoration(
// //                                       hintText: '98765XXXXX',
// //                                       enabledBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
// //                                       ),
// //                                       focusedBorder: OutlineInputBorder(
// //                                         borderSide: BorderSide(color: Color(0xff0CECDA)),
// //                                       ),
// //                                       hintStyle: GoogleFonts.kufam(
// //                                           color: Colors.white.withOpacity(0.5)),
// //                                       contentPadding: const EdgeInsets.symmetric(
// //                                           vertical: 20.0, horizontal: 15.0),
// //                                       border: OutlineInputBorder(),
// //                                       fillColor: Color(0xff141318),
// //                                       filled: true,
// //                                     ),
// //                                     style: TextStyle(color: Colors.white),
// //                                   ),
// //                                   SizedBox(height: 20),
// //
// //                                   ElevatedButton(
// //                                     onPressed: () {
// //                                       if (_formKey.currentState!.validate()) {
// //                                         // If all fields are valid, navigate to the next screen
// //                                         Navigator.push(
// //                                           context,
// //                                           MaterialPageRoute(builder: (context) => StudentSelectionScreen()),
// //                                         );
// //                                       }
// //                                     },
// //                                     style: ElevatedButton.styleFrom(
// //                                       backgroundColor: Color(0xFF13E9DC),
// //                                       shape: RoundedRectangleBorder(
// //                                         borderRadius: BorderRadius.circular(20.0),
// //                                       ),
// //                                       minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
// //                                     ),
// //                                     child: Text(
// //                                       'Next',
// //                                       style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
// //                                     ),
// //                                   ),
// //                                   // ElevatedButton(
// //                                   //   onPressed: () {
// //                                   //     Navigator.push(
// //                                   //       context,
// //                                   //       MaterialPageRoute(builder: (context) => StudentSelectionScreen()),
// //                                   //     );
// //                                   //     _saveStudentData();
// //                                   //   },
// //                                   //   style: ElevatedButton.styleFrom(
// //                                   //     backgroundColor: Color(0xFF13E9DC),
// //                                   //     shape: RoundedRectangleBorder(
// //                                   //       borderRadius: BorderRadius.circular(20.0),
// //                                   //     ),
// //                                   //     minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
// //                                   //   ),
// //                                   //   child: Text(
// //                                   //     'Next',
// //                                   //     style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
// //                                   //   ),
// //                                   // ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ]),
// //     );
// //   }
// // }
// //
// //
//
//
//
import 'dart:io' show File;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/student_main_screen.dart';
import 'package:majorproject/teacher_main_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:majorproject/resources/add_data.dart';
import 'package:majorproject/resources/utils.dart';
import 'detailScreens/StudentData/Acadmeic/student_startup.dart';
// import 'package:firebase_core/firebase_core.dart';


class studentDataSheet extends StatefulWidget {
  @override
  _studentDataSheetState createState() => _studentDataSheetState();
}

class _studentDataSheetState extends State<studentDataSheet> {
  Uint8List? _image;

  final DatabaseReference _studentRef =
  FirebaseDatabase.instance.ref().child('student');
  final DatabaseReference _studentRefer =
  FirebaseDatabase.instance.ref().child('studentphoto');

  final ImagePicker imagePicker = ImagePicker();

  String _selectedImage='';
  String selectedYearofAdmission ='';
  List<String> years = List.generate(25, (index) => (2018 + index).toString());


  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  DateTime selectedDate = DateTime.now();

  void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }


  void saveProfile() async{

    String name  = _fullNameController.text;

    String resp = await StoreData().saveData(name: name, file: _image!);

  }


  void showYearPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.sizeOf(context).height*0.285,
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

  Future<void> _saveStudentData() async {
    try {
      String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      await _studentRef.child('id').child(_rollNumberController.text).set({
        'fullName': _fullNameController.text,
        'emailAddress': _emailAddressController.text,
        'rollNumber': _rollNumberController.text,
        'dateOfBirth': formattedSelectedDate,
        'permanentAddress': _permanentAddressController.text,
        'jeeRank': _jeeRankController.text,
        'mobileNumber': _mobileNumberController.text,
        // 'image': _selectedImage,
        'year': _yearController.text,
        'fatherName': _fatherNameController.text,
        'fatherOccupation': _fatherOccupationController.text,
        'fatherOfficeAddress': _fatherOfficeAddressController.text,
        'fatherPhoneNumber': _fatherPhoneNumberController.text,
        'motherName': _motherNameController.text,
        'motherOccupation': _motherOccupationController.text,
        'motherOfficeAddress': _motherOfficeAddressController.text,
        'motherPhoneNumber': _motherPhoneNumberController.text,

      });
    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }

  Future<void> _uploadImageAndSaveData(StudentImage student) async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      try {
        // Upload image to Firebase Storage
        Reference storageRef = FirebaseStorage.instance.ref().child('images').child(student.enrollmentNumber);
        await storageRef.putFile(imageFile);

        // Get the download URL of the uploaded image
        String imageUrl = await storageRef.getDownloadURL();

        // Save the imageUrl field in Firebase Realtime Database
        await _studentRefer.child(_rollNumberController.text).set({'image': imageUrl});

        // Update the imageUrl field locally
        setState(() {
          student.imageUrl = imageUrl;
        });
      } catch (error) {
        print('Error uploading image: $error');
      }
    }
  }
  Future<void> _saveStudentNameEmail() async {
    String fullName = _fullNameController.text;
    String emailAddress = _emailAddressController.text;

    // Save student's name and email using SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('student_name', fullName);
    await prefs.setString('student_email', emailAddress);
  }


  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _rollNumberController = TextEditingController();
  final TextEditingController _permanentAddressController = TextEditingController();
  final TextEditingController _jeeRankController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _yearController = TextEditingController();

  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _fatherOccupationController = TextEditingController();
  final TextEditingController _fatherOfficeAddressController = TextEditingController();
  final TextEditingController _fatherPhoneNumberController = TextEditingController();

  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _motherOccupationController = TextEditingController();
  final TextEditingController _motherOfficeAddressController = TextEditingController();
  final TextEditingController _motherPhoneNumberController = TextEditingController();


  @override

  // void dispose() {
  //   _fullNameController.dispose();
  //   _emailAddressController.dispose();
  //   _rollNumberController.dispose();
  //   _permanentAddressController.dispose();
  //   _jeeRankController.dispose();
  //   _mobileNumberController.dispose();
  //   _imageController.dispose();
  //   _yearController.dispose();
  //   _fatherNameController.dispose();
  //   _fatherOccupationController.dispose();
  //   _fatherOfficeAddressController.dispose();
  //   _fatherPhoneNumberController.dispose();
  //   _motherNameController.dispose();
  //   _motherOccupationController.dispose();
  //   _motherOfficeAddressController.dispose();
  //   _motherPhoneNumberController.dispose();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141318),
//       body: Stack(
      body: Stack(
//
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
                  height: 100,
                ),
                Text(
                  'Student\'s Data Sheet',
                  style: GoogleFonts.kufam(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      color: Color(0xff0CECDA)),
                ),
                SizedBox(
                  height: 20,
                ),
                // Headings and Slider
                Container(
                  height: 50.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          // color: _currentPage == 0 ? Colors.blue : Colors.grey,
                          child: Center(
                              child: Text(
                                'Student’s details',
                                style: GoogleFonts.kufam(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xff0CECDA)),
                                // textAlign: TextAlign.center,
                              )
                            // ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          // color: _currentPage == 1 ? Colors.transparent : Colors.grey,
                          child: Center(
                            child: Text(
                              'Parent Details',
                              style: GoogleFonts.kufam(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff0CECDA)),
                              // textAlign: TextAlign.center,)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Details PageView
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: [
                      // Student Details
                      ListView(children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Form(
                            // key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Full Name  ',
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
                                // Text(
                                //   // controller: _fullNameController,
                                //   'Full Name',
                                //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,
                                //       color: Colors.white),),
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
                                        text: 'Email Address  ',
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
                                // Text('Email Address',
                                //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,
                                //       color: Colors.white),),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: _emailAddressController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'shreya@gmail.com',
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
                                SizedBox(
                                  height: 20,
                                ),

                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Enrollment No.  ',
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
                                // Text('Enrollment No.',
                                //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,
                                //       color: Colors.white),),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: _rollNumberController,
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
                                    hintText: '98753',
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
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Date of Birth  ',
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
                                // Text('Date of Birth',
                                //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,
                                //       color: Colors.white),),
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
                                        text: 'Address  ',
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
                                // Text('Address',
                                //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,
                                //       color: Colors.white),),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: _permanentAddressController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter permanent address',
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
                                SizedBox(
                                  height: 20,
                                ),

                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Year of admission  ',
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
                                // Text('Year of admission',
                                //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,
                                //       color: Colors.white),),
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
                                        controller: TextEditingController(text: selectedYearofAdmission),
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

                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'JEE Rank  ',
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
                                // Text('JEE Rank',
                                //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,
                                //       color: Colors.white),),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: _jeeRankController,
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
                                    hintText: '54728',
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
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Mobile No.  ',
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
                                // Text('Mobile No.',
                                //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,
                                //       color: Colors.white),),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: _mobileNumberController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }else if (value.length != 10) {
                                      return 'Please enter a valid phone no.';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                    hintText: '98765XXXXX',
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
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Upload Photograph  ',
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
                                // Text('Upload Photograph',
                                //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,
                                //       color: Colors.white),),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child:
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                        Stack(
                                            children:[ 
                                              TextField(
                                              controller: _imageController,
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                hintText: 'Browse',
                                                suffixIcon: IconButton(
                                                  icon: Icon(Icons.add, size: 25.0,),
                                                  onPressed: () async{
                                                    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
                                                    if(pickedFile != null){
                                                      setState(() {
                                                        _selectedImage = pickedFile.path;
                                                      });
                                                      // final student = StudentStartup(
                                                      //   id: 'id',
                                                      //   enrollmentNumber: 'your_enrollment_number',
                                                      //   companyName: 'your_company_name',
                                                      //   companyProfile: 'your_company_profile',
                                                      //   startingDate: 'your_starting_date',
                                                      //   designation: 'your_designation',
                                                      //   location: 'your_location',
                                                      // );
                                                      //await _uploadImageAndSaveData(student);
                                                    }
                                                    //_pickImage();
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
                                              if(_selectedImage != null)
                                                Image.file(
                                                    File(_selectedImage),
                                                  height:  100,
                                                    width: 100,
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

                                      // If all fields are valid, navigate to the next screen
                                      _pageController.animateToPage(
                                        1,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );

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
                        ),
                      ]),

                      // Teacher Details
                      ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16.0),
                            child: Form(
                              // key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Father Details',
                                    style: GoogleFonts.kufam(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.white),),
                                  SizedBox(height: 5),

                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Father’s Name  ',
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
                                  // Text('Father’s Name',
                                  //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    controller: _fatherNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Name',
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
                                          text: 'Occupation  ',
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
                                  // Text('Occupation',
                                  //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    controller:_fatherOccupationController ,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Business',
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
                                  SizedBox(
                                    height: 20,
                                  ),

                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Office Address  ' ,
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
                                  // Text('Office Address',
                                  //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    controller: _fatherOfficeAddressController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Enter address',
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
                                  SizedBox(
                                    height: 20,
                                  ),

                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Official Phone No.  ',
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
                                  // Text('Official Phone No.',
                                  //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    controller: _fatherPhoneNumberController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }else if (value.length != 10) {
                                        return 'Please enter a valid phone no.';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    maxLength: 10,
                                    decoration: InputDecoration(
                                      hintText: '98765XXXX',
                                      counterText:'',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff0CECDA)),
                                      ),
                                      hintStyle: GoogleFonts.kufam(
                                          color: Colors.white.withOpacity(0.5)),
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 18.0),
                                      border: OutlineInputBorder(),
                                      fillColor: Color(0xff141318),
                                      filled: true,
                                    ),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('Mother Details',
                                    style: GoogleFonts.kufam(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.white),),
                                  SizedBox(height: 5),

                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Mother’s Name  ',
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
                                  // Text('Mother’s Name',
                                  //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    controller: _motherNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Name',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff0CECDA)),
                                      ),
                                      hintStyle: GoogleFonts.kufam(
                                          color: Colors.white.withOpacity(0.5)),
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 18.0),
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
                                          text: 'Occupation  ',
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
                                  // Text('Occupation',
                                  //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    controller: _motherOccupationController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Business',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff0CECDA)),
                                      ),
                                      hintStyle: GoogleFonts.kufam(
                                          color: Colors.white.withOpacity(0.5)),
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 18.0),
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
                                          text: 'Office Address  ',
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
                                  // Text('Office Address',
                                  //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    controller: _motherOfficeAddressController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Enter address',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff0CECDA)),
                                      ),
                                      hintStyle: GoogleFonts.kufam(
                                          color: Colors.white.withOpacity(0.5)),
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 18.0),
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
                                          text: 'Official Phone No.  ',
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
                                  // Text('Official Phone No.',
                                  //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,
                                  //       color: Colors.white),),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    controller: _motherPhoneNumberController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }else if (value.length != 10) {
                                        return 'Please enter a valid phone no.';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    maxLength: 10,
                                    decoration: InputDecoration(
                                      hintText: '98765XXXXX',
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
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(height: 20),

                                  // ElevatedButton(
                                  //   onPressed: () async{
                                  //     if (Form.of(context)!.validate()) {
                                  //       await _saveStudentNameEmail();
                                  //     // if (Form.of(context)!.validate()) {
                                  //     //   _saveStudentData();
                                  //       Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(builder: (context) => StudentSelectionScreen()),
                                  //       );
                                  //     }
                                  //   },
                                  //   style: ElevatedButton.styleFrom(
                                  //     backgroundColor: Color(0xFF13E9DC),
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(20.0),
                                  //     ),
                                  //     minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
                                  //   ),
                                  //   child: Text(
                                  //     'Save',
                                  //     style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
                                  //   ),
                                  // ),
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(builder: (context) => StudentSelectionScreen()),
                                  //     );
                                  //     _saveStudentData();
                                  //   },
                                  //   style: ElevatedButton.styleFrom(
                                  //     backgroundColor: Color(0xFF13E9DC),
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(20.0),
                                  //     ),
                                  //     minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 48.0),
                                  //   ),
                                  //   child: Text(
                                  //     'Save',
                                  //     style: GoogleFonts.kufam(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
                                  //   ),
                                  // ),
                                  ElevatedButton(
                                    onPressed: () async {

                                      // final TextEditingController _fullNameController = TextEditingController();
                                      // final TextEditingController _emailAddressController = TextEditingController();
                                      // final TextEditingController _rollNumberController = TextEditingController();
                                      // final TextEditingController _permanentAddressController = TextEditingController();
                                      // final TextEditingController _jeeRankController = TextEditingController();
                                      // final TextEditingController _mobileNumberController = TextEditingController();
                                      // TextEditingController _imageController = TextEditingController();
                                      // TextEditingController _yearController = TextEditingController();
                                      //
                                      // final TextEditingController _fatherNameController = TextEditingController();
                                      // final TextEditingController _fatherOccupationController = TextEditingController();
                                      // final TextEditingController _fatherOfficeAddressController = TextEditingController();
                                      // final TextEditingController _fatherPhoneNumberController = TextEditingController();
                                      //
                                      // final TextEditingController _motherNameController = TextEditingController();
                                      // final TextEditingController _motherOccupationController = TextEditingController();
                                      // final TextEditingController _motherOfficeAddressController = TextEditingController();
                                      // final TextEditingController _motherPhoneNumberController = TextEditingController();

                                      if(_fullNameController.text.isEmpty ||
                                          _emailAddressController.text.isEmpty ||
                                          _rollNumberController.text.isEmpty ||
                                          _permanentAddressController.text.isEmpty ||
                                          _jeeRankController.text.isEmpty ||
                                          _mobileNumberController.text.isEmpty ||
                                          _fatherNameController.text.isEmpty ||
                                          _fatherOccupationController.text.isEmpty ||
                                          _fatherOfficeAddressController.text.isEmpty ||
                                          _fatherPhoneNumberController.text.isEmpty ||
                                          _motherNameController.text.isEmpty ||
                                          _motherOccupationController.text.isEmpty ||
                                          _motherOfficeAddressController.text.isEmpty ||
                                          _motherPhoneNumberController.text.isEmpty){
                                        QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.error,
                                          title: 'Oops...',
                                          text: 'Please fill in all the required fields.',
                                        );
                                      }else if(_rollNumberController.text.length != 11) {
                                        QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.warning,
                                          text: 'Please enter a valid Enrollment No.',
                                        );
                                      }else if(_mobileNumberController.text.length != 10){
                                        QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.warning,
                                          text: 'Please enter a valid Phone No. in Student\'s detail',
                                        );
                                      }else if(_fatherPhoneNumberController.text.length != 10){
                                        QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.warning,
                                          text: 'Please enter a valid Phone No. in Father\'s detail',
                                        );
                                      }else if(_motherPhoneNumberController.text.length != 10){
                                        QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.warning,
                                          text: 'Please enter a valid Phone No. in Mother\'s detail',
                                        );
                                      }
                                      else{
                                        QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.success,
                                          text: 'Saved Successfully!',
                                        );
                                        await _saveStudentNameEmail();
                                        // Save student's name and email
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => StudentSelectionScreen()),
                                        );
                                        final student = StudentImage(
                                          id: 'id',
                                          enrollmentNumber: _rollNumberController.text,

                                        );
                                        await _uploadImageAndSaveData(student);
                                        _saveStudentData(); // Not sure what this function does, remove or use it as needed

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
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}

class StudentImage {
  final String id;

  final String enrollmentNumber;

   String imageUrl;

  StudentImage({
    required this.id,
    required this.enrollmentNumber,
     this.imageUrl='',

  });
}