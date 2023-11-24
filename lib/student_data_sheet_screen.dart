import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/teacher_main_screen.dart';


class studentDataSheet extends StatefulWidget {
  @override
  _studentDataSheetState createState() => _studentDataSheetState();
}

class _studentDataSheetState extends State<studentDataSheet> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name',
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
                              Text('Email Address',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'shreya@gamil.com',
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
                              Text('Roll No.',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: '98753',
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
                              Text('Date of Birth',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Select a date',
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
                              Text('Address',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Enter permanent address',
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
                              Text('Year of admission',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Select',
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
                              Text('JEE Rank',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: '54728',
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
                              Text('Mobile No.',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: '98765XXXXX',
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
                              Text('Upload Photograph',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Browse',
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

                              ElevatedButton(
                                onPressed: () {

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
                      ]),

                      // Teacher Details
                      ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Father Details',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffFFFFFF))),
                                Text('Father’s Name',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(height: 5),
                                TextField(
                                    decoration: InputDecoration(
                                  hintText: 'Name',
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
                                Text('Occupation',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(height: 5),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Business',
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
                                Text('Office Address',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(height: 5),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter address',
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
                                Text('Official Phone No.',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(height: 5),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: '98765XXXX',
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
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(height: 5),
                                Text('Mother’s Name',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(height: 5),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Name',
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
                                Text('Occupation',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(height: 5),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Business',
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
                                Text('Office Address',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(height: 5),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter address',
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
                                Text('Official Phone No.',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(height: 5),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: '98765XXXXX',
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

                                ElevatedButton(
                                  onPressed: () {

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

                    ],
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}


