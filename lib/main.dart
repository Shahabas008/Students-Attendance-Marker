import 'package:collegeproject/attendancemarkcheck.dart';
import 'package:collegeproject/create_an_account/classselection.dart';
import 'package:collegeproject/create_an_account/loginpage.dart';
import 'package:collegeproject/create_an_account/signup.dart';
import 'package:collegeproject/create_an_account/studentaccountfirstpage.dart';
import 'package:collegeproject/create_an_account/studentaccountsecondpage.dart';
import 'package:collegeproject/create_an_account/teacheraccountfirstpage.dart';
import 'package:collegeproject/create_an_account/teacheraccountsecondpage.dart';
import 'package:flutter/material.dart';
import 'package:collegeproject/Resources/palette.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Resources/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Palette.kToDark),
      initialRoute: 'splashscreen',
      routes: {
        'splashscreen': (context) => const Loginpage(),
        'loginpage': (context) => const Loginpage(),
        'navigatingtosignup': (context) => const Signuppage(),
        'navigatingtoteacheraccountsignup': (context) =>
            const Teacheraccpage1(),
        'navigatingtostudentaccountsignup': (context) =>
            const  Studentaccpage1(),
        'navigatingtoteacheraccountsignup2': (context) =>
            const Teacheraccpage2(),
        'navigatingtostudentaccountsignup2': (context) =>
            const Studentaccpage2(),
        'navigatingtoattendancemarkcheck': (context) =>
            const Attendancemarkcheck(),
        'navigatingtoclassselectionpage': (context) => const Classselection(),

        
      },
    );
  }
}
