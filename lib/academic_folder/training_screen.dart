import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/main.dart';
// import 'package:majorproject/teacher_data_sheet_screen.dart';
// import 'package:majorproject/teacher_main_screen.dart';
// import 'package:majorproject/student_data_sheet_screen.dart';

class TrainingScreen extends StatefulWidget {
  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedButton = '';
  DateTime durationFromDate = DateTime.now();
  DateTime durationToDate = DateTime.now();

  String selectedYearofAdmission ='';
  List<String> years = List.generate(4, (index) => (1 + index).toString());

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

  TextEditingController _yearController = TextEditingController();

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
            key: _formKey,
            child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Internship/Training Details',
                    style: GoogleFonts.kufam(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                        color: Color(0xff0CECDA)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView(children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            //training title
                            Text('Training/Project Title',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
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
                            Text('Team Size',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: '2',
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
                            Text('Duration of Internship/Course',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: '2 months',
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
                            Text('Duration from date',
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
                            Text('To Date',
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
                            Text('Platform/Technology Used',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
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
                            Text('Research/Application based',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
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

                            Text('Guide/Mentor Name',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
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


                            Text('Designation of Guide/Mentor',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Manager',
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
                            Text('Name of the Company/Course/Organization/University/Any other',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
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
                            Text('Company Address/University Address (Place/Location)',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
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


                            Text('Sector',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
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

                            Text('Scale',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
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

                            Text('Incorporation Status',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
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

                            Text('Products/Service based(In which company deals)',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
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

                            Text('Mode of Training',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
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
                              style: TextStyle(color: Colors.white),),
                            SizedBox(
                              height: 20,
                            ),

                            Text('Company Website Link/Course Link',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
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

                            //Year
                            // Text('Year',
                            //   style: GoogleFonts.kufam(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),),
                            // SizedBox(height: 5),
                            // Padding(
                            //   padding: const EdgeInsets.all(0),
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       showYearPicker(context);
                            //     },
                            //     child: AbsorbPointer(
                            //       child: TextField(
                            //         readOnly: true,
                            //         controller: TextEditingController(text: selectedYearofAdmission),
                            //         decoration: InputDecoration(
                            //           hintText: 'Select',
                            //           enabledBorder: OutlineInputBorder(
                            //             borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                            //           ),
                            //           suffixIcon: Icon(Icons.arrow_drop_down,
                            //             size: 40.0,),
                            //           focusedBorder: OutlineInputBorder(
                            //             borderSide: BorderSide(color: Color(0xff0CECDA)),
                            //           ),
                            //           hintStyle: GoogleFonts.kufam(
                            //               color: Colors.white.withOpacity(0.5)),
                            //           contentPadding: const EdgeInsets.symmetric(
                            //               vertical: 20.0, horizontal: 15.0),
                            //           border: OutlineInputBorder(),
                            //           fillColor: Color(0xff141318),
                            //           filled: true,
                            //         ),
                            //         style: TextStyle(color: Colors.white),
                            //       ),
                            //     ),
                            //   ),),
                            // SizedBox(
                            //   height: 20,
                            // ),

                            Text('Stipend Amount',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 5),
                            TextFormField(
                              // controller: _fullNameController,
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
                                if (_formKey.currentState!.validate()) {
                                  // If all fields are valid, navigate to the next screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => TrainingScreen()),
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



// ]
//     ),);
//   }
// }





