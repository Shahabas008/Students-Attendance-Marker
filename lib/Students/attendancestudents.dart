import 'package:collegeproject/controller/addstudentscontroller.dart';
import 'package:collegeproject/controller/attendancecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceStudents extends StatefulWidget {
  const AttendanceStudents({super.key});

  @override
  State<AttendanceStudents> createState() => _AttendanceStudentsState();
}

class _AttendanceStudentsState extends State<AttendanceStudents> {
  final data = Get.put(Countercontroller());
  final controller = Get.put(Attendancecontroller());
  final subname = Get.arguments["subname"];
  @override
  void initState() {
    
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Attendance Date"),
        ),
        // body: StreamBuilder<QuerySnapshot>(
        //   stream: FirebaseFirestore.instance
        //       .collection("Teacher")
        //       .doc(subname)
        //       .collection("Attendance")
        //       .snapshots(),
        //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //     if(snapshot.hasData){
              
        //       if(snapshot.data == null || snapshot.data!.docs.isEmpty){
        //         print(subname);
        //          return const Center(
        //          child: Text('There is no Date to display',
        //           style: TextStyle(
        //             fontSize: 20,
        //             fontWeight: FontWeight.bold,
        //             color:  Color.fromARGB(255, 161, 46, 46),
        //           ),),
        //         );
        //       }
        //       else{
        //         return ListView.builder(
        //           itemBuilder:(_,index){
        //             DocumentSnapshot data = snapshot.data!.docs[index];
        //             MaterialButton(
        //               onPressed:() {
        //                 Get.to(() => const Attendancelistteacher());
        //               },
        //               child:Text(data[index]) ,);
        //             return null;
        //           });
        //       }
        //     }
        //     else{
        //       return const CircularProgressIndicator();
        //     }
        //   },
        // ),
      ),
    );
  }
}
