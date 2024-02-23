import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:majorproject/academic_activity_screen.dart';
import 'package:majorproject/main.dart';
import 'package:majorproject/teacher_main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:majorproject/teacher_data_sheet_screen.dart';
// import 'package:majorproject/teacher_main_screen.dart';
// import 'package:majorproject/student_data_sheet_screen.dart';

class PublicationScreen extends StatefulWidget {
  @override
  _PublicationScreenState createState() => _PublicationScreenState();
}

class _PublicationScreenState extends State<PublicationScreen> {
  final DatabaseReference _teacherRef =
  FirebaseDatabase.instance.ref().child('teacherspaperpublished');
  final DatabaseReference _teacherRefer =
  FirebaseDatabase.instance.ref().child('teachersbookpublished');
  @override
  void initState() {
    retrievename();
    super.initState();
  }
  bool _showPapersPublishedTextField = false;
  bool _showBooksPublishedTextField = false;
  String selectedButton = '';
  String selectedYearOfPapers = '';
  String selectedMonthOfPapers = '';
  String selectedYearOfBooks = '';
  String selectedMonthOfBooks = '';
  List<String> years = List.generate(25, (index) => (2000 + index).toString());
  List<String> months = DateFormat().dateSymbols.MONTHS; // Get month names
   String storedname ='' ;

  TextEditingController _yearController = TextEditingController();
  TextEditingController _monthController = TextEditingController();


  Future<void> retrievename() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? storedname = prefs.getString('fullName');
    print('name is $storedname');
  }
  void showYearPickerOfPapers(BuildContext context) {
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
                    selectedYearOfPapers = year;
                    _yearController.text = selectedYearOfPapers; // Set the text in the controller
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

  void showMonthPickerOfPapers(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 200,
          child: ListWheelScrollView(
            itemExtent: 40,
            children: months.map((String month) {
              return ListTile(
                title: Center(
                  child: Text(
                    month,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedMonthOfPapers = month;
                    _monthController.text = selectedMonthOfPapers; // Set the text in the controller
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

  void showYearPickerOfBook(BuildContext context) {
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
                    selectedYearOfBooks = year;
                    _yearController.text = selectedYearOfBooks; // Set the text in the controller
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

  void showMonthPickerOfBook(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 200,
          child: ListWheelScrollView(
            itemExtent: 40,
            children: months.map((String month) {
              return ListTile(
                title: Center(
                  child: Text(
                    month,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedMonthOfBooks = month;
                    _monthController.text = selectedMonthOfBooks; // Set the text in the controller
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
// controller research paper wale
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _titleOfPaperController = TextEditingController();
  final TextEditingController _journalNameController = TextEditingController();
  final TextEditingController _isbnNoController = TextEditingController();

  // controllers for book published teachers
  final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _publicationtypeController = TextEditingController();
  final TextEditingController _authorNameController = TextEditingController();
  final TextEditingController _detailsOfPublicationController = TextEditingController();
  final TextEditingController _volumeandIssuenoController = TextEditingController();
  final TextEditingController _pageNoController = TextEditingController();
  final TextEditingController _isbnNoBookController = TextEditingController();

  Future<void> _saveTeacherData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await _teacherRef.child('id').child(_fullNameController.text).set({
        'fullName': _fullNameController.text,
        'tileOfPaper': _titleOfPaperController.text,
        'journalName': _journalNameController.text,
        'month': selectedMonthOfPapers.toString(),
        'year': selectedYearOfPapers.toString(),
        'isbnNo': _isbnNoController.text,

      });
      await prefs.setString('fullName', _fullNameController.text);
      String? storedFullName = prefs.getString('fullName');
      print('Stored Full Name: $storedFullName');

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }


  Future<void> _saveTeacherBookPublishedData() async {
    try {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      await _teacherRefer.child('id').child(_authorNameController.text).set({
        'bookName': _bookNameController.text,
        'publicationType': _publicationtypeController.text,
        'authorName': _authorNameController.text,
        'month': selectedMonthOfBooks.toString(),
        'year': selectedYearOfBooks.toString(),
        'isbnNo': _isbnNoBookController.text,
        'details': _detailsOfPublicationController.text,
        'volumeAndIssueNo': _volumeandIssuenoController.text,
        'pageNO':_pageNoController.text,


      });
      // await prefs.setString('fullName', _fullNameController.text);
      // String? storedFullName = prefs.getString('fullName');
      // print('Stored Full Name: $storedFullName');

    } catch (error) {
      // Handle the error
      print('Error saving data: $error');
    }
  }
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
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
                    'Publication ',
                    style: GoogleFonts.kufam(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                        color: Color(0xff0CECDA)),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Expanded(
                    child: ListView(children: [
                      //Research paper published button
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child:
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _showPapersPublishedTextField = !_showPapersPublishedTextField;
                            });
                          },
                          icon: Icon(
                            _showPapersPublishedTextField ? Icons.remove : Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
                          label: Text(
                            _showPapersPublishedTextField ? 'Research Papers Published' : 'Research Papers Published',
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
                      if (_showPapersPublishedTextField) ...[
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name of the Faculty Member',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
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
                              Text('Title of the Research Paper',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                 controller: _titleOfPaperController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Abc ',
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

                              Text('Name of the journal',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                 controller: _journalNameController,
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
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              Text(
                                'Month',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  showMonthPickerOfPapers(context);
                                },
                                child: AbsorbPointer(
                                  child: TextField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: 'Select',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                                      ),
                                      suffixIcon: Icon(Icons.arrow_drop_down, size: 40.0,),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff0CECDA)),
                                      ),
                                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                                      border: OutlineInputBorder(),
                                      fillColor: Color(0xff141318),
                                      filled: true,
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    controller: TextEditingController(text: selectedMonthOfPapers),
                                  ),
                                ),
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
                                    showYearPickerOfPapers(context);
                                  },
                                  child: AbsorbPointer(
                                    child: TextField(
                                      readOnly: true,
                                      controller: TextEditingController(text: selectedYearOfPapers),
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
                              Text('ISSN/ISBN No.',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                 controller: _isbnNoController,
                                decoration: InputDecoration(
                                  hintText: '1234',
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
                            ],
                          ),
                        ),
                      ],

                      //Books published button
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child:
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _showBooksPublishedTextField = !_showBooksPublishedTextField;
                            });
                          },
                          icon: Icon(
                            _showBooksPublishedTextField ? Icons.remove : Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
                          label: Text(
                            _showBooksPublishedTextField ? 'Books Published' : 'Books Published',
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
                      if (_showBooksPublishedTextField) ...[
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Book/ Book Chapter',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                 controller: _bookNameController,
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
                              Text('Publication type',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextFormField(
                                 controller: _publicationtypeController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Abc ',
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

                              Text('Author',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                 controller: _authorNameController,
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
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              Text('Details of publication',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                 controller: _detailsOfPublicationController,
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
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              Text('Volume and Issue no.',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _volumeandIssuenoController,
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
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              Text('Page Nos.',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _pageNoController,
                                decoration: InputDecoration(
                                  hintText: '100',
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

                              Text(
                                'Month',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  showMonthPickerOfBook(context);
                                },
                                child: AbsorbPointer(
                                  child: TextField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: 'Select',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff535353)), // Color when not focused
                                      ),
                                      suffixIcon: Icon(Icons.arrow_drop_down, size: 40.0,),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff0CECDA)),
                                      ),
                                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                                      border: OutlineInputBorder(),
                                      fillColor: Color(0xff141318),
                                      filled: true,
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    controller: TextEditingController(text: selectedMonthOfBooks),
                                  ),
                                ),
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
                                    showYearPickerOfBook(context);
                                  },
                                  child: AbsorbPointer(
                                    child: TextField(
                                      readOnly: true,
                                      controller: TextEditingController(text: selectedYearOfBooks),
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
                              Text('ISSN/ISBN No.',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 5),
                              TextField(
                                controller: _isbnNoBookController,
                                decoration: InputDecoration(
                                  hintText: '1234',
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

                            ],
                          ),
                        ),
                      ],
                    ],

                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if(_fullNameController.text != null ) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeacherSelectionScreen()),
                        );
                        _saveTeacherData();
                      }
                      if(_authorNameController.text !=null){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeacherSelectionScreen()),
                        );
                        _saveTeacherBookPublishedData();
                      }
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
                ]),
          ]
      ),);
  }
}
