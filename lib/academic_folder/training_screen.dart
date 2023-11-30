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
  String selectedButton = '';

  String selectedYearofAdmission ='';
  List<String> years = List.generate(4, (index) => (1 + index).toString());

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
          Column(
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
                          Text('Company/Course Name',
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
                          Text('Duration',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          TextField(
                            // controller: _emailAddressController,
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
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Year',
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
                          Text('Stipend',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          TextField(
                            // controller: _permanentAddressController,
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
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Field',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          TextField(
                            // controller: _fatherHusbandNameController,
                            decoration: InputDecoration(
                              hintText: 'Software development',
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

                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TrainingScreen()),
                              );
                              // _saveTeacherData();
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


        ],
      ),

    );


  }
}



// ]
//     ),);
//   }
// }





