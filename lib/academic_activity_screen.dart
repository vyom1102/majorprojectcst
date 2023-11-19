import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AcademicScreen extends StatelessWidget {
  final List<String> buttonTitles = [
    'Training',
    'Result',
    'Courses',
    'Seminar',
    'Competition',
    'Higher Studies',
    'Startup',
    'Placement',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21262E),
      body: Stack(
        children: [
          Image.asset(
            'images/Group 174.png', // Adjust this to your background image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text(
                  'Student',
                  style: GoogleFonts.marcellus(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: buttonTitles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                          foregroundColor: Colors.black,
                          backgroundColor: Color(0xff1E94FF),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        child: Text(buttonTitles[index],style: GoogleFonts.marcellus(fontSize: 22,),textAlign: TextAlign.center,),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
