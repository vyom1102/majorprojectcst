import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/main.dart';
import 'package:quickalert/quickalert.dart';

class MinorMajorProjectScreen extends StatefulWidget {
  @override
  _MinorMajorProjectScreenState createState() => _MinorMajorProjectScreenState();
}

class _MinorMajorProjectScreenState extends State<MinorMajorProjectScreen> {
  // final DatabaseReference _studentTran =
  // FirebaseDatabase.instance.ref().child('StudentData').child('Academic').child('studentSeminar');
  bool _showMinorTextField = false;
  bool _showMajorTextField = false;
  String selectedButton = '';

  // Future<void> _saveSeminarData() async {
  //   try {
  //     await _studentTran.child('id').child(_studentnameController.text).set({
  //       'enrollmentNumber': _studentnameController.text,
  //       'nameOfFaculty' : _nameController.text,
  //       'duration' : _durationController.text,
  //       'address' : _addressController.text,
  //       'StartingDate' : selectedDate.toString(),
  //       'EndingDate' : joiningDate.toString(),
  //     });
  //
  //   } catch (error) {
  //     // Handle the error
  //     print('Error saving data: $error');
  //   }
  // }

  final TextEditingController _projectIdController = TextEditingController();
  final TextEditingController _projectTitleController = TextEditingController();
  final TextEditingController _prospectiveGuideNameController = TextEditingController();
  final TextEditingController _prospectiveCoGuideController = TextEditingController();
  final TextEditingController _member1Controller = TextEditingController();
  final TextEditingController _member1GroupController = TextEditingController();
  final TextEditingController _member2Controller = TextEditingController();
  final TextEditingController _member2GroupController = TextEditingController();
  final TextEditingController _member3Controller = TextEditingController();
  final TextEditingController _member3GroupController = TextEditingController();

  final TextEditingController _majorProjectIdController = TextEditingController();
  final TextEditingController _majorProjectTitleController = TextEditingController();
  final TextEditingController _majorProspectiveGuideNameController = TextEditingController();
  final TextEditingController _majorProspectiveCoGuideController = TextEditingController();
  final TextEditingController _majorMember1Controller = TextEditingController();
  final TextEditingController _majorMember1GroupController = TextEditingController();
  final TextEditingController _majorMember2Controller = TextEditingController();
  final TextEditingController _majorMember2GroupController  = TextEditingController();
  final TextEditingController _majorMember3Controller = TextEditingController();
  final TextEditingController _majorMember3GroupController  = TextEditingController();

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
                      'Minor/Major Projects',
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
                              Container(
                                padding: EdgeInsets.all(16.0),
                                child:
                                ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      _showMinorTextField = !_showMinorTextField;
                                    });
                                  },
                                  icon: Icon(
                                    _showMinorTextField ? Icons.remove : Icons.add,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  label: Text(
                                    _showMinorTextField ? 'Minor' : 'Minor',
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
                              if (_showMinorTextField) ...[
                                Container(
                                  padding: EdgeInsets.all(16.0),
                                  child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Project Id',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _projectIdController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: '101-CSE',
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

                                      Text('Project Title',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
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

                                      Text('Prospective Project Guide',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _prospectiveGuideNameController,
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

                                      Text('Prospective Co-Guide',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _prospectiveCoGuideController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Mr. Abc ',
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

                                      Text('Member 1 Name',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _member1Controller,
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

                                      Text('Member 1 Group',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _member1GroupController,
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

                                      Text('Member 2 Name',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _member2Controller,
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

                                      Text('Member 2 Group',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _member2GroupController,
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

                                      Text('Member 3 Name',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _member3Controller,
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

                                      Text('Member 3 Group',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _member3GroupController,
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
                                      // Add more text fields as needed
                                    ],
                                  ),),
                              ],


                              Container(
                                padding: EdgeInsets.all(16.0),
                                child:
                                ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      _showMajorTextField = !_showMajorTextField;
                                    });
                                  },
                                  icon: Icon(
                                    _showMajorTextField ? Icons.remove : Icons.add,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  label: Text(
                                    _showMajorTextField ? 'Major' : 'Major',
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
                              if (_showMajorTextField) ...[
                                Container(
                                  padding: EdgeInsets.all(16.0),
                                  child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Project Id',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _majorProjectIdController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: '101-CSE',
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

                                      Text('Project Title',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _majorProjectTitleController,
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

                                      Text('Prospective Project Guide',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _majorProspectiveGuideNameController,
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

                                      Text('Prospective Co-Guide',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _majorProspectiveCoGuideController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Mr. Abc ',
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

                                      Text('Member 1 Name',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _majorMember1Controller,
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

                                      Text('Member 1 Group',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _majorMember1GroupController,
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

                                      Text('Member 2 Name',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _majorMember2Controller,
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

                                      Text('Member 2 Group',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _majorMember2GroupController,
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

                                      Text('Member 3 Name',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _majorMember3Controller,
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

                                      Text('Member 3 Group',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: _majorMember3GroupController,
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

                                      // Add more text fields as needed
                                    ],
                                  ),),
                              ],

                            ],
                          ),
                        ),
                      ],),),
                    ElevatedButton(
                      onPressed: () {
                        // if (_studentnameController.text != null) {
                        // If all fields are valid, navigate to the next screen
                        // _saveSeminarData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MinorMajorProjectScreen()),
                        );
                        // }
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
                  ]),
            ),]
      ),);
  }
}
