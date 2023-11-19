import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21262E),
      body: Stack(
        children: [
          Image.asset(
            'images/Group 174.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset(
                'images/Group 176.png',
                height: MediaQuery.sizeOf(context).height*0.35,
                width: MediaQuery.sizeOf(context).width,
              ),
              SizedBox(height: 20),


              Text(
                'Student',
                style: GoogleFonts.marcellus(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),


              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Color(0xff1E94FF),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text('Academic Activity',),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Color(0xff1E94FF),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text('Co-curricular Activity'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Color(0xff1E94FF),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text('Sports'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Color(0xff1E94FF),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text('NCC/NSS'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}