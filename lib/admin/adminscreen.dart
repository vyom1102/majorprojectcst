import 'package:flutter/material.dart';
import 'package:majorproject/detailScreens/StudentData/student_personaldetail.dart';
import 'package:majorproject/detailScreens/TeacherData/teacher_personaldetail.dart';


class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.05,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {
          //           _pageController.animateToPage(0,
          //               duration: Duration(milliseconds: 500),
          //               curve: Curves.easeInOut);
          //         },
          //         child: Text('Student'),
          //         style: ButtonStyle(
          //           backgroundColor:
          //           MaterialStateProperty.all<Color>(Colors.transparent),
          //         ),
          //       ),
          //       SizedBox(width: 10),
          //       ElevatedButton(
          //         onPressed: () {
          //           _pageController.animateToPage(1,
          //               duration: Duration(milliseconds: 500),
          //               curve: Curves.easeInOut);
          //         },
          //         child: Text('Teacher'),
          //         style: ButtonStyle(
          //           backgroundColor:
          //           MaterialStateProperty.all<Color>(Colors.transparent),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
                StudentList(),
                TeacherList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

