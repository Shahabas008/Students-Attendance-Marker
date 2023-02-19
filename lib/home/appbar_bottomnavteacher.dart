import 'package:collegeproject/home/calendarpage.dart';
import 'package:collegeproject/home/homepageteacher.dart';
//import 'package:collegeproject/homepagetearcher.dart';
import 'package:flutter/material.dart';
import 'package:bottom_nav_bar/bottom_nav_bar.dart';

class Appbarbottomavteacher extends StatefulWidget {
  const Appbarbottomavteacher({super.key});

  @override
  State<Appbarbottomavteacher> createState() => _AppbarbottomnavteacherState();
}

class _AppbarbottomnavteacherState extends State<Appbarbottomavteacher> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 234, 234, 234),
        appBar: AppBar(
          title: const Text(
            'Student Attendence Marker',
          ),
          centerTitle: true,
        ),
      body: _body(),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _body() => SizedBox.expand(
        child: IndexedStack(
          index: _selectedIndex,
          children: const <Widget>[
            Homepageteacher(),
            Calendarpage(),
           // AccountPage(),
          ],
        ),
      );
  Widget _bottomNavBar() => BottomNavBar(
          
          animationDuration: const Duration(milliseconds:200),
          showElevation: true,
          selectedIndex: _selectedIndex,
          onItemSelected: (index) {
            setState(() => _selectedIndex = index);
          },
          items: <BottomNavBarItem>[
            BottomNavBarItem(
              title: '',
              icon: const Icon(Icons.home,
              size: 35,),
              activeColor: Colors.white,
              inactiveColor: Colors.black,
              activeBackgroundColor:const Color.fromARGB(255, 0, 0, 0),
            ),
            BottomNavBarItem(
              title: '',
              icon: const Icon(Icons.calendar_today,
              size: 30,),
              activeColor: Colors.white,
              inactiveColor: Colors.black,
              activeBackgroundColor:const Color.fromARGB(255, 0, 0, 0),
            ),
            BottomNavBarItem(
              title: '',
              icon: const Icon(Icons.person,
              size: 30,),
              inactiveColor: Colors.black,
              activeColor: Colors.white,
              activeBackgroundColor:const Color.fromARGB(255, 0, 0, 0),
            )
          ]);
}
