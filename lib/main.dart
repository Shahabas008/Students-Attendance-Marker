//import 'package:collegeproject/signup.dart';
//import 'package:collegeproject/teacheraccountfirstpage.dart';
//import 'package:collegeproject/studentaccountfirstpage.dart';
//import 'package:collegeproject/studentaccountfirstpage.dart';
//import 'package:collegeproject/studentaccountsecondpage.dart';
//import 'package:collegeproject/studentaccountsecondpage.dart';
//import 'package:collegeproject/loginpage.dart';
///import 'package:collegeproject/signup.dart';
//import 'package:collegeproject/studentaccountfirstpage.dart';
//import 'package:collegeproject/studentaccountsecondpage.dart';
//import 'package:collegeproject/teacheraccountfirstpage.dart';
//import 'package:collegeproject/teacheraccountsecondpage.dart';
//import 'package:collegeproject/signup.dart';
//import 'package:collegeproject/teacheraccountsecondpage.dart';
//import 'package:collegeproject/teacheraccountsecondpage.dart';
//import 'package:collegeproject/studentaccountsecondpage.dart';
//import 'package:collegeproject/teacheraccountsecondpage.dart';
//import 'package:collegeproject/homepageteacher.dart';


//import 'package:collegeproject/appbar_bottomnavteacher.dart';
//import 'package:collegeproject/appbar_bottomnavteacher.dart';
import 'package:collegeproject/attendancemarkcheck.dart';
//import 'package:collegeproject/calendarpage.dart';
import 'package:collegeproject/classselection.dart';
import 'package:collegeproject/homepageteacher.dart';
import 'package:collegeproject/signup.dart';
import 'package:collegeproject/studentaccountfirstpage.dart';
import 'package:collegeproject/studentaccountsecondpage.dart';
import 'package:collegeproject/teacheraccountfirstpage.dart';
import 'package:collegeproject/teacheraccountsecondpage.dart';
//import 'package:collegeproject/loginpage.dart';
//import 'package:collegeproject/homepagetearcher.dart';

import 'package:flutter/material.dart';
import 'package:collegeproject/palette.dart';
import 'package:collegeproject/splashscreen.dart';
//import 'package:collegeproject/loginscreen.dart';
//import 'package:collegeproject/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
        theme: ThemeData(
       primarySwatch:Palette.kToDark
      ),
      home:const ScreenSplash() ,
    
      initialRoute: 'splashscreen',
  routes: {
    'splashscreen':(context) => const Teacheraccpage2(),
    //'loginpage': (context) => const Loginpage(),
    //'navigatingtosignup':(context) => const Signuppage(),
    //'navigatingtoteacheraccountsignup':(context) => const Teacheraccpage1(),
    //'navigatingtostudentaccountsignup':(context) => const Studentaccpage1(),
    //'navigatingtoteacheraccountsignup2':(context) => const Teacheraccpage2(),
    //'navigatingtostudentaccountsignup2':(context) => const Studentaccpage2(),
    'navigatingtoattendancemarkcheck':(context) => const Attendancemarkcheck(),
    'navigatingtoclassselectionpage':(context) => const Classselection(),




    //'homepage': (context) => const HomePage1(),

  },
);
    
     
    
  }
}
